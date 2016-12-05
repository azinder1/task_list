require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tasks')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'to_do_test'})

get('/') do
  erb(:index)
end

post('/') do
  description = params.fetch("description")
  @task = Task.new(:description => description)
  @task.save()
  @tasks = Task.all()
  erb(:output)
end

get('/output') do
  @tasks = Task.all()
  erb(:output)
end
