require "pg"

class Merchant

  def initialize(params)
    @id = nil || params['id']
    @name = params['name']
  end


  def save
    SqlRunner.run_sql("INSERT INTO merchants (name) VALUES '#{@name}'")
    return last_entry
  end


  def last_entry
    sql = "SELECT * FROM merchants ORDER BY DESC limit 1"
    return Merchant.map_item(sql)
  end


  def update
    SqlRunner.run_sql("UPDATE merchants SET name = #'{params['name']}'")
  end


  def self.map_items(sql)
    merchants = SqlRunner.run_sql(sql)
    result = merchants.map{ |merchant| Merchant.new(merchant)}
    return result
  end


  def self.map_items(sql)
    result = Merchant.map_items(sql)
    return result.first
  end


  def self.all
    sql = "SELECT * FROM merchants"
    result = Merchants.map_items(sql)
  end

  def self.find(id)
    transaction = SqlRunner.run_sql("SELECT * FROM merchants WHERE id = #{id}")
    result = Merchant.new(transaction[0])
    return  result
  end

  def self.destroy
    SqlRunner.run_sql("DELETE * FROM merchants WHERE id = #{id}")
  end

end 