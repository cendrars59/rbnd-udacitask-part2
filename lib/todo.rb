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
    common_details(@type,@description)+
    "Priority:".green+format_priority(@priority)+
    "Due:".green+format_date("todo",@due)
  end

end
