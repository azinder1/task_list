require('rspec')
require('pg')
require('tasks')

DB = PG.connect({:dbname => 'to_do_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
  end
end

describe (Task) do
  describe('#==') do
    it('is the same taks if it has the same description') do
      task1 = Task.new({:description => "learn SQL"})
      task2 = Task.new({:description => "learn SQL"})
      expect(task1).to(eq(task2))
    end
  end

  describe('.all') do
    it "it will return all(it should be empty)" do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
    it('will push a new description into an array for a new task') do
      task1 = Task.new({:description => "learn SQL"})
      task1.save()
      expect(Task.all()).to(eq([task1]))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1})
      expect(test_task.list_id()).to(eq(1))
    end
  end
end
