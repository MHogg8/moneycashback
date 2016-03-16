require "pg"
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :day, :description, :tag_id, :merchant_id

  def initialize(params)
    @id = nil || params['id']
    @amount = params['amount'].to_f
    @day = params['day']
    @description = params['description']
    @tag_id = params['tag_id'].to_i
    @merchant_id = params['merchant_id'].to_i
  end


  def save
    SqlRunner.run_sql("INSERT INTO transactions 
                      (amount, day, description, tag_id, merchant_id) 
                      VALUES (#{@amount}, '#{@day}', '#{@description}', 
                      #{@tag_id}, #{@merchant_id})")
    return last_entry
  end


  def last_entry
    sql = "SELECT * FROM transactions ORDER BY id DESC limit 1"
    return Transaction.map_item(sql)
  end


  def self.all
    sql = "SELECT * FROM transactions"
    return Transaction.map_items(sql)
  end


  def update(params)
    SqlRunner.run_sql("UPDATE transactions SET 
      amount = #{params['amount']}, 
      day = '#{params['day']}', 
      description = '#{params['description']}', 
      tag_id = '#{params['tag_id']}', 
      merchant_id = '#{params['merchant_id']}' 
      WHERE id = #{id}")
  end


  def self.map_items(sql)
    transactions = SqlRunner.run_sql(sql)
    result = transactions.map{ |transaction| Transaction.new(transaction)}
    return result
  end


 def self.map_item(sql)
   result = Transaction.map_items(sql)
   return result.first
 end


  def self.find(id) #should be able to change this one slightly to return all tags.
    transaction = SqlRunner.run_sql("SELECT * FROM transactions WHERE id = #{id}")
    result = Transaction.new(transaction[0])
    return result
  end


  def self.delete_all
    SqlRunner.run_sql("DELETE FROM transactions")
  end


  def self.destroy(id)
    SqlRunner.run_sql("DELETE FROM transactions WHERE id = #{id}")
  end

end