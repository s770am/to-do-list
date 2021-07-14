require 'sinatra'


require_relative 'Task'

get "/" do
    redirect to("/todolist")
end

get "/todolist" do
    @todolist = Task.order(:importance).all
   erb :todolist
end



get "/create_form" do
    erb :create_form
end

get "/change_form/:id" do
    @task = Task.find(params[:id])
    erb :change_form
end



post '/change/:id' do
    change_task = Task.find(params[:id])
    change_task.desciption = params[:desciption]
    change_task.importance = params[:importance]
    change_task.save
    redirect to("/todolist")
end

post '/createTask' do
    task = Task.new
    task.desciption = params[:desciption]
    task.importance = params[:importance]
    task.save
    redirect to("/todolist")
end

get '/done/:id' do
    Task.find(params[:id]).delete
    redirect to("/todolist")
end