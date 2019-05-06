require 'sinatra'
require "json"
require 'sinatra/contrib'
require 'pg'
require './models/location'
require './models/eventlocation'
require './models/post'

# require 'sinatra/reloader' if development?
require './controller/location_controller'
require './controller/eventlocation_controller'
require './controller/post_controller'


class App < Sinatra::Base
  use Rack::MethodOverride
  use PostController
  use LocationController
  use EventLocationController




  get "/" do
    erb :'app/index'

  end
end
