require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tasks')
require('pg')

DB = PG.connect({:dbname => "to_do"})
