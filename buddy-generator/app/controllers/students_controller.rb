class StudentsController < ApplicationController
  def index
    @session = Session.last
    @students = []
    @students << Student.new(name: 'Alone', alone: true)
    @students += Student.all.sample(@session.num_students)
    @students.each { |student| student.session_id = @session }
  end
end
