class AddSessionToStudents < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :session, foreign_key: true
  end
end
