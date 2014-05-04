require 'sinatra'
require './expense.rb'

expenses = []

get '/' do
	erb :index
end

get '/new' do
	erb :new
end

post '/save' do
	if expenses.empty?
		expense = Expense.new(1, params[:item], params[:amount])
		expenses << expense
	else
		last_expense = expenses.last
		next_id = last_expense[:id]
		expense = Expense.new('next_id+1', params[:item], params[:amount])
		expenses << expense
	end 
	redirect to '/'
end

get '/show/:id' do
	erb :show
end
