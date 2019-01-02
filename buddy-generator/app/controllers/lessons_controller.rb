class LessonsController < ApplicationController

  def show
    @lesson = Lesson.find(params[:id])
    @session = Session.find(@lesson.session_id)
    @pairs = Pair.where(lesson_id: @lesson)
  end

  def create
    # Initialize key variables
    @session = Session.find(params[:session])
    current_lesson = @session.current_lesson

    # Create new lesson for session
    @lesson = Lesson.create!(
      session_id: @session.id,
      lesson_num: current_lesson
    )

    # Generate pairs for lesson
    generate_pairs

    # Update + save lesson number in session
    @session.current_lesson += 1
    @session.save!

    # Redirect to lesson show page
    redirect_to lesson_path(@lesson)
  end

  private

  def generate_pairs

    # Calcuate number of pairs required
    pairs_required = @session.num_students / 2
    @pairs_found = 0

    # Reset availability status of students
    reset_student_availability

    # Generate required number of pairs
    until pairs_required == @pairs_found

      # Select next student who needs to be paired
      student = Student.find_by(session_id: @session.id, active: true, available: true)

      # Update availability of student
      student.available = false
      student.save!

      # Generate pair for student
      generate_pair(student)
    end
  end

  def generate_pair(student)

    # Create array of available buddies
    available_buddies = Student.where(session_id: @session.id, active: true, available: true)

    # Retrieve buddies that have previously paired with student
    previous_pairs = Pair.where(student1_id: student)
                         .or(Pair.where(student2_id: student))

    # Filter these potential buddies out of available buddies
    previous_pairs.each do |pair|
      if pair.student1_id == student.id
        available_buddies = available_buddies.where.not(id: pair.student2_id)
      else
        available_buddies = available_buddies.where.not(id: pair.student1_id)
      end
    end

    # Select potential buddy at random
    buddy = available_buddies.sample

    # Create new pair between student and buddy
    Pair.create!(student1_id: student.id,
                 student2_id: buddy.id,
                 lesson_id: @lesson.id)

    # Update @pairs_found
    @pairs_found += 1

    # Update availability of student and buddy
    buddy.available = false
    buddy.save!
  end

  def reset_student_availability
    students = Student.where(session_id: @session.id, active: true)
    students.each do |student|
      student.available = true
      student.save!
    end
  end
end
