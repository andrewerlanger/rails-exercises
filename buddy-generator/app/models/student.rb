class Student < ApplicationRecord
  belongs_to :session
  validates :name, uniqueness: true
end
