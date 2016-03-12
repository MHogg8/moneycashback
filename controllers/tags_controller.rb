require_relative('../models/tag')

get '/tags' do
  @tags = Tag.all
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