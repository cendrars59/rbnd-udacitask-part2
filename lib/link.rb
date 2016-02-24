class LinkItem
  include Listable

  attr_reader :description, :site_name

  def initialize(url,options={})
    @description = url
    @site_name = options[:site_name]
    @type = type
  end

  def details
    common_details(@type,@description)+
    "Site: ".green + format_name(@site_name)
  end

  def type
    return "link"
  end

end
