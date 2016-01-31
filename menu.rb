require_relative "todolist"

class Menu
	def initialize
		@todo_list = TodoList.new("Untitled To-Do List")
	end

	def print_menu
		system ('cls') or system ('clear')
		@todo_list.print_list
		print_menu_options
	end

	def print_menu_options
		puts "----------------------------------------------"
		puts "1) Rename List       |      2) Add task  "
		puts "3) Complete task     |      4) Uncomplete task"
		puts "5) Prioritize task   |      6) Normalize task "
 		puts "7) Add due date      |      8) Remove due date"
		puts "9) Delete task       |      0) Exit"
		puts "----------------------------------------------"
		puts "Enter choice: "
		choice = get_choice.to_i
		options(choice)
	end

	def get_choice
		gets.chomp
	end

	def options(choice)
		if choice == 1
			rename_submenu
		elsif choice == 2
			add_task_submenu
		elsif choice == 3
			complete_submenu
		elsif choice == 4
			uncomplete_submenu
		elsif choice == 5
			prioritize_submenu
		elsif choice == 6
			normalize_submenu
		elsif choice == 7
			due_date_submenu
		elsif choice == 8
			remove_date_submenu
		elsif choice == 9
			delete_task_submenu
		else
			puts "Enjoy your day"
		end
	end

	def due_date_submenu
		puts "Enter number of task to add a due date:"
		choice = get_choice.to_i
		puts "Enter date to add (in yy-mm-dd format)"
		date_choice = get_choice
		@todo_list.add_due_date choice, date_choice
		print_menu
	end

	def remove_date_submenu
		puts "Enter number of task to remove due date:"
		choice = get_choice.to_i
		@todo_list.remove_due_date(choice)
		print_menu
	end


	def prioritize_submenu
		puts "Enter number of task to prioritize:"
		choice = get_choice.to_i
		@todo_list.prioritize_item(choice)
		print_menu
	end

	def normalize_submenu
		puts "Enter number of task to normalize:"
		choice = get_choice.to_i
		@todo_list.normalize_item(choice)
		print_menu
	end


	def complete_submenu
		puts "Enter number of task to complete:"
		choice = get_choice.to_i
		@todo_list.complete_item(choice)
		print_menu
	end

	def uncomplete_submenu
		puts "Enter number of task to uncomplete:"
		choice = get_choice.to_i
		@todo_list.uncomplete_item(choice)
		print_menu
	end

	def add_task_submenu
		puts "Enter task to add to list:"
		choice = get_choice
		@todo_list.add_item(choice)
		print_menu
	end

	def delete_task_submenu
		puts "Enter number of task to remove:"
		choice = get_choice.to_i
		@todo_list.remove_item(choice)
		print_menu
	end

	def rename_submenu
		puts "Enter new list name:"
		choice = get_choice
		@todo_list.rename_title(choice)
		print_menu
	end



end