class UdaciList
  attr_reader :title, :items
  @@authorized_listable_type =["todo","event","link"]

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end

  def add(type,description,options={})
    type = type.downcase
      @items.push TodoItem.new(description,options) if type == "todo"
      @items.push EventItem.new(description,options) if type == "event"
      @items.push LinkItem.new(description,options) if type == "link"
      fail UdaciListErrors::InvalidItemType, "#{type} type doesn't exist".red if !@@authorized_listable_type.include?(type)
  end

  def item_index_exists?(index)
    index < @items.length
  end

  def delete(index)
    if item_index_exists?(index)
      @items.delete_at(index - 1)
    else
      fail UdaciListErrors::IndexExceedsListSize, "#{index} : the selected item doesn't exist".red
    end
  end

  def select_by_filter(filter)
    @items.select{|item| item.type == filter}
  end

  def filter(filter)
    select_by_filter(filter).each do |item|
        puts "#{item.details}"
    end
  end

  def all
    puts "-".magenta * @title.length
    puts @title.magenta
    puts "-".magenta * @title.length
    @items.each_with_index do |item, position|
      puts "#{(position + 1)} #{item.details}"
    end
  end

end
