class Pair < ApplicationRecord
  belongs_to :lesson
  has_one :student1, class_name: "student"
  has_one :student2, class_name: "student"
end
