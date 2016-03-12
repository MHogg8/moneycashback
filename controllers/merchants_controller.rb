require_relative('../models/merchant')

get '/merchants' do
  @merchants = Merchant.all
  erb(:'merchants/index')
end

get '/merchants/new' do
  erb(:'merchants/new')
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to 'merchants'
end

get '/merchants/:id' do
  @merchant= Merchant.find(params[:id])
  erb(:'merchants/show')
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id])
  erb(:'merchants/edit')
end

post '/merchants/:id' do
  @merchant = Merchant.new(params)
  @merchant.update(params)
  redirect to "/merchants/#{params['id']}"
end