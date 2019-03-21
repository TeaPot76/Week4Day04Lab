require('pry-byebug')
require_relative('../models/student.rb')
require_relative('../models/house.rb')

House.delete_all
Student.delete_all

house1 = House.new({
  'name' => 'Gryffindor',
  'logo' => 'logo1'
  })

house2 = House.new({
  'name' => 'Slytherin',
  'logo' => 'logo2'
  })

house3 = House.new({
  'name' => 'Ravenclaw',
  'logo' => 'logo3'
  })

house4 = House.new({
  'name' => 'Hufflepuff',
  'logo' => 'logo4'
  })

house1.save
house2.save
house3.save
house4.save
# Student.delete_all

student1 = Student.new({
  'first_name' => 'Harry',
  'second_name' => 'Potter',
  'house_id' => house1.id,
  'age' => 15
  })

student2 = Student.new({
  'first_name' => 'Ron',
  'second_name' => 'Weasley',
  'house_id' => house1.id,
  'age' => 16
  })

student3 = Student.new({
  'first_name' => 'Draco',
  'second_name' => 'Malfoy',
  'house_id' => house2.id,
  'age' => 17
  })

student4 = Student.new({
  'first_name' => 'Cho',
  'second_name' => 'Chang',
  'house_id' => house3.id,
  'age' => 14
  })

student5 = Student.new({
  'first_name' => 'Cedric',
  'second_name' => 'Diggory',
  'house_id' => house4.id,
  'age' => 18
  })

student1.save
student2.save
student3.save
student4.save
student5.save




binding.pry
nil
