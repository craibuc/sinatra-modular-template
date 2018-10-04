# puts "#{__FILE__}"

require './app.rb'

map('/') { run RootController }
