require './lib/task'

@list = []

def main_menu
  loop do
    puts "Press 'a' to add a task or 'l to list all of your tasks."
    puts "Press 'x' to exit."
    main_choice = gets.chomp
    if main_choice == 'a'
      add_task
    elsif main_choice == 'l'
      list_tasks
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    else
      puts "Sorry that wasn't a valid option."
    end
  end
end

def add_task
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  @list << Task.new(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @list.each do |task|
    puts @list.index(task).to_s + " " + task.description
  end
  puts "\n"
  puts "Would you like to delete any of the tasks?"
    list_tasks_response = gets.chomp
    if list_tasks_response == "yes" || list_tasks_response == "y"
      puts "Type the number of the task you would like to delete"
      user_task_delete = gets.chomp
      @list.slice!(user_task_delete.to_i)
    elsif list_tasks_response == "no" || list_tasks_response == "n"
      main_menu
  end

end

main_menu
