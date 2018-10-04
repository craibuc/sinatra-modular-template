# puts "#{__FILE__}"

class ApplicationController < Sinatra::Base

  helpers ApplicationHelper if defined?(ApplicationHelper)

  # set folder for templates to ../views, but make the path absolute
  # set :views, File.expand_path('../../views', __FILE__)

  # configure do
  #   # http://sinatrarb.com/intro.html#Using%20Sessions
  #   set :sessions, true
  #   set :sessions, :expire_after => (ENV['SESSION_DURATION'].is_a? Numeric) ? ENV['SESSION_DURATION'].to_i : 60*60*24
  #   set :session_secret, ENV['SESSION_SECRET']
  # end

  # configure :development do
  #   # http://sinatrarb.com/contrib/reloader.html
  #   # register Sinatra::Reloader  # using Shotgun instead
  # end

  # configure :development,:production do
  #   enable :logging
  # end

  # error 403 do
  #   title 'Forbidden'
  #   erb :'errors/403'
  # end

  # error 404 do
  #   title 'Not Found'
  #   erb :'errors/404'
  # end

end
