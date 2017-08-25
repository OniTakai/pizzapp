require 'sinatra'
enable :sessions 

get '/' do
    erb :index
end 

post '/toppings' do
    session[:my_size] = params[:my_size]
    session[:my_meat] = params[:my_meat]
    session[:my_veg] = params[:my_veg]
    session[:my_cheese] = params[:my_cheese]
    redirect '/confirm'
end

get '/confirm' do
    erb :confirm, locals: {my_size: session[:my_size],my_meat: session[:my_meat],my_veg: session[:my_veg],my_cheese: session[:my_cheese]}
end
