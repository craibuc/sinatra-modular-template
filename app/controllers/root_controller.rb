# puts "#{__FILE__}"

require 'json'

class RootController < ApplicationController

  helpers RootHelper if defined?(RootHelper)

  get '/' do

    logger.info "Someone is attempting to GET /"

    title "Root"
    erb :'root/index'
  end

  get '/env' do
    title "Environment"
    erb :'root/env'
  end

  get '/protected' do
    title "Protected"

    logger.info "** access denied **"

    halt 403
  end

  get '/json' do

    content_type :json

    {results: [
      {id: 'CA',text: 'Canada'},{id:'CH',text:'Switzerland'},{id:'FR',text:'France',disabled: true},{id:'US',text:'United States'}
    ]}.to_json

  end

  get '/flash' do
    title "Flash"

    flash[:info] = Time.now.strftime("%I:%M:%S")
    flash[:success] = "success, success"
    flash[:warning] = "warning, warning"
    flash[:danger] = "failure, failure"
    erb :'root/flash'
  end

end