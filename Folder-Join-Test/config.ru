require 'sinatra'
require 'sinatra/contrib'
require 'pg'

require "./app"

use Rack::MethodOverride
use PostController


run App
