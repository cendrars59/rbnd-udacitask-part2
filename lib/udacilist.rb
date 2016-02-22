class UdaciList
  attr_reader :title, :items,:max_items_number

  @max_items_number = 10

  def initialize(options={})
    @title = options[:title]
    @items = []
  end

  def items_list_count_below_the_limit?
    @items.length < @max_items_number || @items.empty?
  end

  def add(type, description,options={})
    #if items_list_count_below_the_limit?
      type = type.downcase
      @items.push TodoItem.new(description, options) if type == "todo"
      @items.push EventItem.new(description, options) if type == "event"
      @items.push LinkItem.new(description, options) if type == "link"
    #else
      #raise IndexExceedsListSize, "impossible to add more than #{@max_items_number} items"
    #end
  end

  def delete(index)
    @items.delete_at(index - 1)
  end

  def all
    puts "-" * @title.length
    puts @title.magenta
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end

end
