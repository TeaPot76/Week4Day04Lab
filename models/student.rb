
require_relative('../db/sql_runner')

class Student
  attr_reader :id
  attr_accessor :first_name, :second_name, :house, :age
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house_id'].to_i
    @age = options['age'].to_i
  end

def save
  sql = 'INSERT INTO students (first_name, second_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id'
  values = [@first_name, @second_name, @house, @age]
  @id = SqlRunner.run(sql, values).first()['id'].to_i
end

def update
  sql = 'UPDATE students SET (first_name, second_name, house_id, age) = ($1, $2, $3, $4) WHERE id=$5'
  values = [@first_name, @second_name, @house, @age, @id]
  SqlRunner.run(sql, values)
end

def delete
  sql = 'DELETE FROM students WHERE id = $1'
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all
  sql = 'DELETE FROM students'
  SqlRunner.run(sql)
end

def self.find_by_id(id)
  sql = 'SELECT * FROM students WHERE id = $1'
  values = [id]
  result = SqlRunner.run(sql, values)
  student = Student.new(result.first)
  return student
end

def self.all
  sql = 'SELECT * FROM students'
  students = SqlRunner.run(sql)
  return students.map{|student| Student.new(student)}
end

def house_name
  sql = 'SELECT students.house_id FROM students INNER JOIN houses ON students.house_id = houses.id WHERE students.id = $1'
  values = [@id]
  house_id = SqlRunner.run(sql, values).first['house_id'].to_i
  house = House.find_by_id(house_id)
return house.name

end

end
