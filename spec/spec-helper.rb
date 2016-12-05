require('rspec')
require('pg')
require('list')
require('tasks')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM lists_test *;")
  end
end
