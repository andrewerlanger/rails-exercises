class Session < ApplicationRecord
  has_many :students
  validates :num_students,
            numericality: { less_than_or_equal_to: 100, only_integer: true }
end
