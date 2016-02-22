class TodoItem
  include Listable

  attr_reader :description, :due, :priority
  @@todoitemslist = []

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    add_to_todo_list
  end

  def self.all
    @@todoitemslist
  end

  def details
    format_description(@description).magenta +
    "due: " +
    format_date("todo",@due) +
    format_priority(@priority)
  end

  private

  def add_to_todo_list
    @@todoitemslist << self
  end

end
