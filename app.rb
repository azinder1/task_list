require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tasks')
require('pg')


get('/') do
  erb(:index)
end
