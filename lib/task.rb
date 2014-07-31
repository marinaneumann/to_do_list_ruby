class Task
  def initialize(description)
    @description = description
  end

  def description
    @description
  end
end

class List
  def initialize(name)
    @name = name
    @tasks = []
  end

  def name
    @name
  end

  def add_task(task)
    @tasks << task
  end

  def tasks
    @tasks
  end
end
