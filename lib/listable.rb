
module Listable


  def format_description(description)
    "#{description}".ljust(30)
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

  def format_priority(priority)
    value = " ⇧".green if priority == "high"
    value = " ⇨".yellow if priority == "medium"
    value = " ⇩".red if priority == "low"
    value = "" if !priority
    return value
  end

  def format_name(site_name)
    site_name ? site_name : ""
  end

  private

  def todo_format_date(due)
    due ? due.strftime('%D') : 'No due date'
  end

end
