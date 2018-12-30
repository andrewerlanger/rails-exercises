class LessonsController < ApplicationController

  def show

  end

  def create
    # Initialize session
    current_session = Session.find(params[:session])

    # Create new lesson for session
    @lesson = Lesson.create!(
      session_id: current_session.id,
      lesson_num: current_session.current_lesson
    )

    # Generate pairs for lesson

    # Update + save lesson number in session
    current_session.current_lesson += 1
    current_session.save!

    # Redirect to lesson show page
    redirect_to @lesson
  end
end
