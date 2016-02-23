class TodoItem
  include Listable

  attr_reader :description, :due, :priority, :type

  def initialize(description,options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
    @type = type
  end

  def type
    return "todo"
  end

  def details
    format_description(@description).magenta +
    "due: " +
    format_date("todo",@due) +
    format_priority(@priority)+
    "type is :   "
    end


end
