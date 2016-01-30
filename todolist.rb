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
  	@items[item_id-1].complete_item
  end

  def uncomplete_item(item_id)
  	@items[item_id-1].uncomplete_item
  end

  def get_item_index(item)
  	@items.index(item)
  end

  ## Print the title and call the Item print method
  def print_list
  	puts @title
   	@items.each do |item|
  		item_index = get_item_index(item)
  		item.print_item(item_index + 1)
  	end
	end

end

class Item
  # methods and stuff go here
  attr_accessor :description, :completed_status

  def initialize(item_description)
    @description = item_description
    @completed_status = false
  end

  def item_completed?
  	@completed_status
  end

  def complete_item
  	@completed_status = true
  end

  def uncomplete_item
  	@completed_status = false
  end

  def print_item(index)
  	check_box = item_completed? ? "[x]" : "[ ]"
   	puts "#{check_box} #{index} - #{@description}"
  end

end
