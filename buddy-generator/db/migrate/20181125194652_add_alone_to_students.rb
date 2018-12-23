class AddAloneToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :alone, :boolean, default: false
  end
end
