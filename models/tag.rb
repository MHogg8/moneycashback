require "pg"
require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name 

  def initialize(params)
    @id = nil || params['id']
    @name = params['name']
  end


  def save 
    SqlRunner.run_sql("INSERT INTO tags (name) VALUES ('#{@name}')")
    return last_entry
  end


  def last_entry
    sql = "SELECT * FROM tags ORDER BY id DESC limit 1"
    return Tag.map_item(sql)
  end


  def update(params)
    SqlRunner.run_sql("UPDATE tags SET name = '#{params['name']}' Where id = #{id}") #think this is params{name} because it is the update and is a new param not the initial one, check this out as not quite clear. Obviously the syntax for this different but it would be good to be clear in teh reason why this - actually - is it not because you are passing it a new param and not the intialzie one. This is teh only instance in which we change the data out with the intialization. 
  end


  def self.map_items(sql) #these both have sql parameters as the sql comes back in array of hashes and these functions sort them into instances of teh class. 
    tags = SqlRunner.run_sql(sql)
    result = tags.map{ |tag| Tag.new( tag )}
    return result
  end


  def self.map_item(sql)
    result = Tag.map_items(sql)
    return result.first
  end


  def self.all
    sql = "SELECT * FROM tags"
    return Tag.map_items(sql)
  end


  def self.find(id)
    tag = SqlRunner.run_sql("SELECT * FROM tags WHERE id = #{id}")
    result = Tag.new(tag[0])
    return result
  end


  def self.delete_all
    SqlRunner.run_sql("DELETE FROM tags")
  end


  def self.destroy(id)
    SqlRunner.run_sql("DELETE * FROM tags WHERE id = #{id}")
  end


end