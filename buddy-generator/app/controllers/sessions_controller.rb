class SessionsController < ApplicationController
  def home
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save!
      create_students
      redirect_to students_path(session: @session.id)
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:num_students, :num_lessons)
  end

  def create_students
    # Create 'alone' case
    Student.create!(name: 'Alone', alone: true, active: false, session: @session)

    # Create all other cases
    @session.num_students.times do
      Student.create!(name: Faker::FunnyName.name, session: @session)
    end
  end
end
