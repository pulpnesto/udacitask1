require_relative 'todolist.rb'

# Creates a new todo list
list = TodoList.new("Today's Chores")

# Add four new items
list.add_item("Eat")
list.add_item("Drink")
list.add_item("Be Merry")
list.add_item("Sleep")

# Print the list
list.print_list

# Delete the first item
list.remove_item(1)

# Print the list
list.print_list

# Delete the second item
list.remove_item(2)

# Print the list
list.print_list

# Update the completion status of the first item to complete
list.complete_item(1)

# Print the list
list.print_list

# Update the title of the list
list.rename_title("Tomorrow's chores")

# Print the list
list.print_list
