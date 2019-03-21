require_relative('../db/sql_runner')

class House
  attr_reader :id
  attr_accessor :name, :logo

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = 'INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id'
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values).first()['id'].to_i
  end

  def update
    sql = 'UPDATE houses SET (name, logo) = ($1, $2) WHERE id=$3'
    values = [@name, @logo, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = 'DELETE FROM houses WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM houses'
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM houses WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)
    house = House.new(result.first)
    return house
  end

  def self.all
    sql = 'SELECT * FROM houses'
    houses = SqlRunner.run(sql)
    return houses.map{|house| House.new(house)}
  end

  def self.all_house_names
    array_of_house_hashes = House.all()
     p array_of_house_hashes.map{ |house| house.name  }

  end


end
