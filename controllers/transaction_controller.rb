require_relative('../models/transaction')

get '/transactions' do
  @transactions = Transaction.all
  @merchants= Merchant.all
  @tags = Tag.all
  erb(:'transactions/index')
end

get '/transactions/new' do
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags =Tag.all
  erb(:'transactions/new')
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to '/transactions'
end

get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  @transactions = Transaction.all
  @merchants = Merchant.all
  @tags =Tag.all
  erb(:'transactions/show')
end

get '/transactions/:id/edit' do
  @merchants = Merchant.all
  @tags = Tag.all
  @transaction =Transaction.find(params[:id])
  erb(:'transactions/edit')
end

post  '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update(params)
  redirect to "/transactions/#{params['id']}"
end

post '/transactions/:id/delete' do
 Transaction.destroy(params[:id])
 redirect to '/transactions'
end

#####################################################

