class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :lesson_num
      t.timestamps
    end
  end
end
