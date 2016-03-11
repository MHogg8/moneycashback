require "pg"

class Transaction

  def initialize(params)
    @id = nil || params['id']
    @amount = params['amount']
    @date = params['date']
    @tag_id = params['tag_id']
    @merchant_id = params['merchant_id']
  end


  def save
    SqlRunner.run_sql("INSERT INTO transactions 
                      (amount, date, tag_id, merchant_id) 
                      VALUES ('#{@amount}', '#{@date}', '
                      #{@tag_id}', '#{@merchant_id}'")
    return last_entry
  end


  def last_entry
    sql = "SELECT * FROM transactions ORDER BY DESC limit 1"
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
  end

  def self.destroy(id)
    SqlRunner.run_sql("DELETE * FROM transactions WHERE id = #{id}")
  end

end