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

post 'confirm' do
    session[:my_size] = params[:my_size]
    session[:my_meat] = params[:my_meat]
    session[:my_veg] = params[:my_veg]
    session[:my_cheese] = params[:my_cheese]
    redirect '/results'
end 

get '/results' do 
    erb :results, locals: {my_size_confirm: session[:my_size_confirm], my_meat_confirm: session[:my_meat_confirm],my_veg_confirm: session[:my_veg_confirm], my_cheese_confirm: session[:my_cheese_confirm]}
end 

post '/results' do
    session[:my_size_confirm] = params[:my_size_confirm]
    session[:my_meat_confirm] = params[:my_meat_confirm]
    session[:my_veg_confirm] = params[:my_veg_confirm]
    session[:my_cheese_confirm] = params[:my_cheese_confirm]
end