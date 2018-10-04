# puts "#{__FILE__}"

require 'bundler'
Bundler.require :default

# settings from .env file
require 'dotenv/load' #if development?

# sinatra-related
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/flash'

# load helpers and controllers
Dir["./app/{helpers,controllers}/*.rb"].each{|file| 
  puts "loading #{file}" if [development?,test?]
  require file 
}

# create class and register libraries
class ApplicationController < Sinatra::Base

  register Sinatra::Contrib

  # flash messages; requires sessions
  register Sinatra::Flash

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../app/views', __FILE__)

  configure do
    # http://sinatrarb.com/intro.html#Using%20Sessions
    set :sessions, true
    set :sessions, :expire_after => (ENV['SESSION_DURATION'].is_a? Numeric) ? ENV['SESSION_DURATION'].to_i : 60*60*24
    set :session_secret, ENV['SESSION_SECRET']
  end

  configure :development do
    # http://sinatrarb.com/contrib/reloader.html
    # register Sinatra::Reloader  # using Shotgun instead
  end

  configure :development,:production do
    enable :logging
  end

  error 403 do
    title 'Forbidden'
    erb :'errors/403'
  end

  error 404 do
    title 'Not Found'
    erb :'errors/404'
  end

end
