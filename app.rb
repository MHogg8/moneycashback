require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/transaction_controller')


get '/' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags = Tag.all
erb(:"home")
  end