require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')