require './lib/task'

@list_list = []

def main_menu
  loop do
    puts "Press 'l' to add a new list"
    puts "Press 's' to see all your lists"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'l'
      add_list
    elsif main_choice == 's'
      see_list
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end

    # puts "Press 'a' to add a task or 'l to list all of your tasks."
    # puts "Press 'x' to exit."
    # main_choice = gets.chomp
    # if main_choice == 'a'
    #   add_task
    # elsif main_choice == 'l'
    #   list_tasks
    # elsif main_choice == 'x'
    #   puts "Goodbye!"
    #   exit
    # else
    #   puts "Sorry that wasn't a valid option."
    # end
  end
end

def add_list
  puts "Enter the name of the new list:"
  user_list_name = gets.chomp
  @list_list << List.new(user_list_name)
  puts "List created.\n\n"

  puts "Would you like to add a task to a list?"
  response = gets.chomp
  if response == "yes" || response == "y"
    see_list
  elsif response == "no" || response == "n"
    main_menu
  end
end

def see_list
  puts "Here are all of your lists:"
  @list_list.each do |list_item|
    @list_number = @list_list.index(list_item).to_s
    puts @list_number + " " + list_item.name
  end
  puts "Type the number of the list you would like to go into or press 'x' to return to the main menu"
   response = gets.chomp
    @list_list.each do |list|
      if response == @list_number
        @selected_list = list
      end
    end
    @selected_name = @selected_list.name
    puts @selected_list.name
   puts "\n"

   puts "Type 'add' to add a task or 'view' to view your current list"
    response = gets.chomp
    if response == 'add'
      add_task_ui
    elsif response == 'view'
      list_tasks
    end
end

def add_task_ui
  puts "Enter a description of the new task:"
  user_description = gets.chomp
  # @tasks << Task.new(user_description)
  @selected_list.add_task(user_description)
  puts "Task added.\n\n"
end

def list_tasks
  puts "Here are all of your tasks:"
  @selected_list.tasks.each do |task|
    puts @selected_list.tasks.index(task).to_s + " " + task
  end
  puts "\n"
  puts "Would you like to delete any of the tasks?"
    list_tasks_response = gets.chomp
    if list_tasks_response == "yes" || list_tasks_response == "y"
      puts "Type the number of the task you would like to delete"
      user_task_delete = gets.chomp
      @selected_list.tasks.slice!(user_task_delete.to_i)
    elsif list_tasks_response == "no" || list_tasks_response == "n"
      main_menu
  end
end

main_menu
