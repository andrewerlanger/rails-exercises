class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.boolean :active, default: true
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
