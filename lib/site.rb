require 'open-uri'
require 'pry'
require 'nokogiri'

class Site

  attr_accessor :name, :description, :page_views, :time_on_site, :bounce_rate
  
  def initialize(site_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  # class methods

  # def self.all
  #   @@all ||= scrape_top_fifty_sites
  # end
  #
  # def self.find(id)
  #   self.all[id-1]
  # end
  #
  # def self.find_by_name(name)
  #   self.all.detect do |site|
  #     site.downcase.strip == name.downcase.strip
  #   end
  # end

  #instance methods

  # def url
  #   @url ||= SITE_BASE_URL + @name.downcase
  # end
  #
  # def description
  #   @description ||= about_doc.
  # end
  #
  # def metrics
  #   metrics ||=
  # end
  #
  # def bounce_rate
  #   @bounce_rate ||= metrics[0]
  # end
  #
  # def page_views
  #   @page_views ||= metrics[1]
  # end
  #
  # def time_on_site
  #   @time_on_site ||= metrics[2]
  # end


  private

end
