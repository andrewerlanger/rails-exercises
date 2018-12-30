class Student < ApplicationRecord
  belongs_to :session
  has_many :pairs
  validates :name, uniqueness: true
end
