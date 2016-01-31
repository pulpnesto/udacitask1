

class TodoList
  # methods and stuff go here
  attr_reader :title, :items

  ## Initialize todo list with a title and no items
  def initialize(list_title)
  	@title = list_title
  	@items = Array.new
  end

  ## Rename the existing title
   def rename_title(edited_title)
  	@title = edited_title
  end

  ## Add an Item to the array of Items
  def add_item(new_item)
  	item = Item.new new_item
  	@items.push item
  end

  ## Remove a taks from list
  def remove_item(item_id)
  	@items.delete_at item_id-1
  end

  ## Flag the task as completed
  def complete_item(item_id)
  	if indexed? item_id
  		@items[item_id-1].complete_item
  	end
  end

  ## Remove completed flag from the task
  def uncomplete_item(item_id)
  	if indexed? item_id
  		@items[item_id-1].uncomplete_item
  	end
  end

  ## Flag the task as a priority
	def prioritize_item(item_id)
		if indexed? item_id
			@items[item_id-1].make_priority
		end
	end

	## Remove priority flag from task
	def normalize_item(item_id)
		if indexed? item_id
			@items[item_id-1].remove_priority
		end
	end

	## Add due date to task using yy-mm-dd format
	def add_due_date(item_id, due_date)
		if indexed? item_id
			@items[item_id-1].set_due_date due_date
		end
	end

	## Remove due date from task
	def remove_due_date(item_id)
		if indexed? item_id
			@items[item_id-1].remove_date
		end
	end

	## Check to see if task id provided by user is in the range of the items array
	def indexed?(item_id)
		size_of_index = @items.length
		if item_id > size_of_index || item_id < 1
			return false
		else
			return true
		end
	end

	## Return the index of the task
  def get_item_index(item)
  	@items.index item
  end

  ## Print the title and call the Item print method
  def print_list
  	puts "----------------------------------------------"
  	puts "#{@title}"
  	puts "----------------------------------------------"
   	@items.each do |item|
  		item_index = get_item_index item
  		item.print_item(item_index + 1)
  	end
	end
end



class Item
	# Not sure of where to place this require...so I put it here and it works!
	require 'date'
  # methods and stuff go here
  attr_accessor :description, :completed_status, :priority, :due_date

  ## Initailize item with a description, and not completed nor a priority
  def initialize(item_description)
    @description = item_description
    @completed_status = false
    @priority = false
  end

  ## Check to see if item is flagged as a priority
  def priority?
  	@priority
  end

  ## Check to see if item is flagged as completed
	def item_completed?
  	@completed_status
  end

  ## Flag item as a priority
  def make_priority
  	@priority = true
  end

  ## Remove priority flag
  def remove_priority
  	@priority = false
  end

  ## Flag item as complete
  def complete_item
  	@completed_status = true
  end

  ## Remove complete flag for item
  def uncomplete_item
  	@completed_status = false
  end

  ## Add due date to item using yy-mm-dd format
  def set_due_date(due_date)
  	@due_date = Date.parse due_date
  	@due_date = @due_date.strftime("%b %d, %Y")
	end

	## Remove due date from item
	def remove_date
		@due_date = nil
	end

	## Check to see if item has a due date.
	def is_date_set?
		if @due_date != nil
			return true
		else
			return false
		end
	end

	## Print method for item, using checkboxes to show complete flag
  def print_item(index)
  	check_box = item_completed? ? "[x]" : "[ ]"
  	output_string = "#{check_box} #{index} - #{@description}"
  	if is_date_set?
  		output_string = "#{output_string}   Due Date: #{@due_date}"
  	end
  	if priority?
  		output_string = "#{output_string} !!! IMPORTANT !!!".upcase
  	end
  	puts output_string
  end
end
