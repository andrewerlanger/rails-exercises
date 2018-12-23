class AddCurrentLessonToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :current_lesson, :integer, default: 1
  end
end
