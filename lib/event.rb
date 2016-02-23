class EventItem
  include Listable
  attr_reader :description,:start_date, :end_date, :type

  def initialize(description, options={})
    @description = description
    @start_date = Date.parse(options[:start_date]) if options[:start_date]
    @end_date = Date.parse(options[:end_date]) if options[:end_date]
    @type = "event"
  end

  def details
    format_description(@description) +
    "event dates: "+
    event_format_date(@start_date,@end_date)+
    "type is :   " + @type
  end

  def type
    return "event"
  end

end
