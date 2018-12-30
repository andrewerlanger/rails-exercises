class AddSessionIdToLessons < ActiveRecord::Migration[5.2]
  def change
    add_reference :lessons, :session, foreign_key: true
  end
end
