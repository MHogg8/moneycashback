require_relative('../models/tag')

get '/tags' do #if I want to add the total to all pages then Trnsaction.all needs to be available in all?! 
  @tags = Tag.all
  @transactions=Transaction.all
  erb(:'tags/index')
end

get '/tags/new' do
  erb(:'tags/new')
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save
  redirect to 'tags'
end

get '/tags/:id' do
  @tag= Tag.find(params[:id])
  @tags = Tag.all   #maybe neccessary for the tags transactions stuff
  @transactions =Transaction.all
  @merchants = Merchant.all
  erb(:'tags/show')
end

get '/tags/:id/edit' do
  @tag = Tag.find(params[:id])

  erb(:'tags/edit')
end

post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update(params)
  redirect to "/tags/#{params['id']}"
end

post '/tags/:id/delete' do
 Tag.destroy(params[:id])
 redirect to '/tags'
end