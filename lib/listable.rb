
module Listable

  @@authorized_listable_priority =["high","medium","low",nil]


  def format_description(description)
    "#{description}".ljust(30).magenta
  end

  def format_date(type,due)
    todo_format_date(due) if type =="todo"
  end

  def event_format_date(start_date, end_date)
    dates = start_date.strftime('%D') if start_date
    dates << ' -- ' + end_date.strftime('%D') if end_date
    dates = 'N/A' unless dates
    dates
  end

  def format_type(type)
    type.ljust(8)
  end

  def common_details(type,description)
    format_description(description)+
    "Type:".green+format_type(type)
  end

  def format_priority(priority)
    if @@authorized_listable_priority.include?(priority)
      value = " ⇧".green if priority == "high"
      value = " ⇨".blue if priority == "medium"
      value = " ⇩".red if priority == "low"
      value = "  " if !priority
      return value.ljust(5)
    else
      fail UdaciListErrors::InvalidPriorityValue, "#{priority} : is not accepted".red
    end
  end

  def format_name(site_name)
    site_name ? site_name : ""
  end

  private
  def todo_format_date(due)
    due ? due.strftime('%D') : 'No due date '
  end

end
