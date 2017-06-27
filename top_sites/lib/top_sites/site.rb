class TopSites::Site

  attr_accessor :name, :page_views, :time_on_site, :bounce_rate, :top_users, :rank
  attr_writer :description

  def initialize(site_hash)
    update_attributes(site_hash)
  end

  #instance methods

  def update_attributes(hash)
    hash.each {|key, value| self.send(("#{key}="), value)}
  end

  def description
    if @description.bytes.count > @description.chars.count
      "The description is not in English and is unavailable. Please visit #{self.name} for more information."
    else
      @description
    end
  end

end
