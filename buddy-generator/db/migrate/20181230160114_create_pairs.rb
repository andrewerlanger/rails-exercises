class CreatePairs < ActiveRecord::Migration[5.2]
  def change
    create_table :pairs do |t|
      t.references :student1
      t.references :student2
      t.references :lesson, foreign_key: true

      t.timestamps
    end
  end
end
