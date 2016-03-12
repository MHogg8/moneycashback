require "pg"
require_relative('../db/sql_runner')

class Transaction

  attr_reader :id, :amount, :date, :tag_id, :merchant_id

  def initialize(params)
    @id = nil || params['id']
    @amount = params['amount'].to_i
    @day = params['day']
    @description = params['description']
    @tag_id = params['tag_id'].to_i
    @merchant_id = params['merchant_id'].to_i
  end


  def save
    SqlRunner.run_sql("INSERT INTO transactions 
                      (amount, day, description, tag_id, merchant_id) 
                      VALUES ('#{@amount}', '#{@day}', '#{@description}', 
                      '#{@tag_id}', '#{@merchant_id}')")
    return last_entry
  end


  def last_entry
    sql = "SELECT * FROM transactions ORDER BY id DESC limit 1"
    return Transaction.map_item(sql)
  end


  def self.all
    sql = "SELECT * FROM transactions"
    SqlRunner.run_sql(sql)
  end


  def update
    SqlRunner.run_sql("UPDATE transactions SET name = '#{params['name']}'")
  end


  def self.map_items(sql)
    transactions = SqlRunner.run_sql(sql)
    result = transactions.map{ |transaction| Transaction.new(transaction)}
    return result
  end


  def self.map_item(sql)
    result = SqlRunner.run_sql(sql)
    return result.first
  end


  def self.find(id)
    transaction = SqlRunner.run_sql("SELECT * FROM transactions WHERE id = #{id}")
    result = Transaction.new(transaction[0])
    return result
  end


  def self.delete_all
    SqlRunner.run_sql("DELETE FROM transactions")
  end


  def self.destroy(id)
    SqlRunner.run_sql("DELETE * FROM transactions WHERE id = #{id}")
  end

end