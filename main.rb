require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "Hello!"
end

get '/hello_world' do
  "Hello, World!"
end

get '/hello_me' do
  @me = "Mike"
  return "Hello, #{@me}"
end

get '/hello_you/:name' do
  @name = params[:name]
  return "Hello, #{@name}"
end

get '/names/:first/:last' do
  @first = first
  @last = last
  return "You can do multiple parameters, #{@first.capitalize} and #{@last.capitalize}"
end

get '/calc/add/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first + @second).to_s
end

get '/calc/multiply/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first * @second).to_s
end

get '/calc/subtract/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first - @second).to_s
end

get '/calc/divide/:first/:second' do
  @first = params[:first].to_i
  @second = params[:second].to_i
  return (@first / @second).to_s
end

get '/oh_hai/:name' do
  @name = params[:name]
  erb :hai
end

get '/calc/:first/:operation/:second' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second]
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first * @second
  when "quotient" then @first / @second
  end
  return @result.to_s
  erb :calc
end

get '/calc_form' do
  @first = params[:first].to_f
  @operation = params[:operation]
  @second = params[:second]
  @result = case @operation
  when "sum" then @first + @second
  when "difference" then @first - @second
  when "product" then @first * @second
  when "quotient" then @first / @second
  end
  return @result.to_s
  erb :calc_form
end
