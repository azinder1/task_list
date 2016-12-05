class Task
  attr_reader(:description, :list_id)


  def initialize(attributes)
    @description = attributes[:description]
    @list_id = attributes[:list_id]
  end

  def ==(another_task)
    self.description() == (another_task.description())
  end

  def self.all
    returned_tasks = DB.exec("Select * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task["description"]
      tasks.push(Task.new({:description => description}))
    end
    tasks
  end

  def save
    saved = DB.exec("INSERT INTO  tasks (description) VALUES ('#{@description}')")
  end
end
