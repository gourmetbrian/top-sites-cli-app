require 'open-uri'
require 'pry'
require 'nokogiri'

require './scraper'

class Site

  attr_accessor :name, :page_views, :time_on_site, :bounce_rate, :top_users, :rank
  attr_writer :description

  def initialize(site_hash)
    site_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  # class methods


  #instance methods

  def update_attributes(site_hash)
  end

  def description
    if @description.bytes.count > @description.chars.count
      "The description is not in English and is unavailable. Please visit #{self.name} for more information."
    else
      @description
    end
  end

  # private

end

# site_3 = Site.new(Scraper.scrape_site_info("Mail.ru"))
# puts site_3.description
# site_2 = Site.new(Scraper.scrape_site_info("Google.co.jp"))
# puts site_2.description
# site = Site.new("Google.com")
# puts site.name
