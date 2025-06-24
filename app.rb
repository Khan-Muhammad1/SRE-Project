require 'sinatra'

set :bind, '0.0.0.0'
set :port, ENV.fetch("PORT") { 4567 }

# Allow all hosts
set :environment, :production
set :raise_errors, false
set :show_exceptions, false

# Disable host verification
set :protection, except: :host_header


shopping_list = []

get "/" do
  erb :index, locals: {items: shopping_list}
end 

 post '/add' do
  item = params[:item]
  shopping_list.push(item) unless item.nil? || item.strip.empty?
  redirect '/'
end 

post '/delete/:index' do
  index = params[:index].to_i
  shopping_list.delete_at(index) if index >= 0 && index < shopping_list.size
  redirect '/'
end 

get '/crash' do
  puts "Crash app"
  exit!
end 

get '/test' do
  puts "Hello CI/CD Worked!!"
end 

