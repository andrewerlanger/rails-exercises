class AddNumStudentsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :num_students, :integer, default: 0
  end
end
