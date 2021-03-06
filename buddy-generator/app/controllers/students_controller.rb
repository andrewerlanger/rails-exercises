class StudentsController < ApplicationController
  def index
    # Initialize session
    @session = Session.find(params[:session_id])

    # Retrieve all students for given session
    @students = Student.where(session_id: @session)
  end
end
