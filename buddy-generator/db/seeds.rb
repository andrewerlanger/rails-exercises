puts 'Dropping db...'

Student.destroy_all if Student.any?
Session.destroy_all if Session.any?

puts 'Creating students...'

# Create 100 instances of student
student_count = 0
until student_count == 100
  student = Student.new(name: Faker::FunnyName.name)
  student_count += 1 if student.save
end
