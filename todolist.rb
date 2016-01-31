

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
  	item = Item.new(new_item)
  	@items.push item
  end

  def remove_item(item_id)
  	@items.delete_at(item_id-1)
  end

  def complete_item(item_id)
  	if indexed?(item_id)
  		@items[item_id-1].complete_item
  	end
  end

  def uncomplete_item(item_id)
  	if indexed?(item_id)
  		@items[item_id-1].uncomplete_item
  	end
  end

	def prioritize_item(item_id)
		if indexed?(item_id)
			@items[item_id-1].make_priority
		end
	end

	def normalize_item(item_id)
		if indexed?(item_id)
			@items[item_id-1].remove_priority
		end
	end

	def add_due_date(item_id, due_date)
		if indexed?(item_id)
			@items[item_id-1].set_due_date(due_date)
		end
	end

	def remove_due_date(item_id)
		if indexed?(item_id)
			@items[item_id-1].remove_date
		end
	end

	def indexed?(item_id)
		size_of_index = @items.length
		if item_id > size_of_index || item_id < 1
			return false
		else
			return true
		end
	end

  def get_item_index(item)
  	@items.index(item)
  end

  ## Print the title and call the Item print method
  def print_list
  	puts "----------------------------------------------"
  	puts "#{@title}"
  	puts "----------------------------------------------"
   	@items.each do |item|
  		item_index = get_item_index(item)
  		item.print_item(item_index + 1)
  	end
	end

end

class Item
	require 'date'
  # methods and stuff go here
  attr_accessor :description, :completed_status, :priority, :due_date

  def initialize(item_description)
    @description = item_description
    @completed_status = false
    @priority = false
  end

  def priority?
  	@priority
  end

	def item_completed?
  	@completed_status
  end

  def make_priority
  	@priority = true
  end

  def remove_priority
  	@priority = false
  end

  def complete_item
  	@completed_status = true
  end

  def uncomplete_item
  	@completed_status = false
  end

  def set_due_date(due_date)
  	@due_date = Date.parse due_date
  	@due_date = @due_date.strftime("%b %d, %Y")
	end

	def remove_date
		@due_date = nil
	end

	def is_date_set?
		if @due_date != nil
			return true
		else
			return false
		end
	end

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
