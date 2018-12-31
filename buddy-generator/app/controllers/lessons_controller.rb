class LessonsController < ApplicationController

  def show

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
    @pairs = generate_pairs()

    # Update + save lesson number in session
    current_session.current_lesson += 1
    current_session.save!

    # Redirect to lesson show page
    redirect_to @lesson
  end

  private

  def generate_pairs()

    # Calcuate number of pairs required
    pairs_required = @session.num_students / 2
    @pairs_found = 0

    # Generate array of active students
    # @students = Student.where(session_id: @session.id).filter(&:active)

    # Iterate through students to find match
    @students.each do |student|

      # Skip if student not available
      next unless student.available

      # Set student status to unavailable
      student.available = false

      # Attempt to generate pair for student
      generate_pair(student)

      # Break when pairs_found == pairs_required
      break if pairs_found == pairs_required
    end
  end

  def generate_pair(student)
    raise
  end

end
