class Student < ApplicationRecord
  belongs_to :session
  has_many :pairs
end
