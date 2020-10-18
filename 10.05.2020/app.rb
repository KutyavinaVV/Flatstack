require "sinatra"
require "sinatra/reloader" if development?
require 'pg'
require 'byebug'
require './ToDo.rb'


configure {set :server, :puma}

conn = PG.connect(dbname: 'postgres', host: 'localhost', user: 'postgres', password: 'postgres')

get '/' do
  "Welcome to my ToDo list!"
end

get "/todos" do
  @results = ToDo.all(conn)

  erb :index
end

get "/todos/new" do
  erb :new
end

get "/todos/:id/edit" do
  @result = ToDo.where(params, conn)[0]

  erb :edit
end

get "/todos/:id" do
  @result = ToDo.where(params, conn)[0]

  erb :show
end

post "/todos" do
  if params["custom_method"] == "DELETE"
    @resalt = ToDo.new(ToDo.where(params, conn)[0], conn).delete

    redirect to("/todos")
  else
    result = ToDo.new(params, conn).save

    id = result[0]["id"]

    redirect to("/todos/#{id}")
  end
end

post "/todos/:id" do
  if params["custom_method"] == "PUT"
    result = ToDo.new(ToDo.where(params, conn)[0],conn).update(params['title'])

    redirect to("/todos/#{params["id"]}")
  end
end
