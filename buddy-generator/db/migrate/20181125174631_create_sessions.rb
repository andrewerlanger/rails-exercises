class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :num_lessons, default: 0

      t.timestamps
    end
  end
end
