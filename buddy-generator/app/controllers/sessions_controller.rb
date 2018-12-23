class SessionsController < ApplicationController
  def home
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    if @session.save!
      redirect_to students_path
    else
      render 'new'
    end
  end

  private

  def session_params
    params.require(:session).permit(:num_students, :num_lessons)
  end
end
