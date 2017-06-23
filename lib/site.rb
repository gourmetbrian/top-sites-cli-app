require 'open-uri'
require 'pry'
require 'nokogiri'

class Site

  attr_accessor :name, :description, :page_views, :time_on_site, :bounce_rate, :top_users, :rank

  def initialize(site_hash)
    student_hash.each {|key, value| self.send(("#{key}="), value)}
  end

  # class methods


  #instance methods


  private

end
