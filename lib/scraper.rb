require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  SITE_BASE_URL = "http://www.alexa.com/siteinfo/"
  TOP_SITES_URL = "http://www.alexa.com/topsites"

  def self.scrape_top_fifty_sites
    doc = Nokogiri::HTML(open(TOP_SITES_URL))
    sites = doc.css("div.listings.table div.site-listing div.DescriptionCell").collect do |site|
      site.css("p").text.strip
    end
    sites
  end

  def self.scrape_site_info(url)
    #create a site hash
    site = {}
    site[:name] = url
    url = SITE_BASE_URL + url.downcase
    site_doc = Nokogiri::HTML(open(url))
    #description
    site[:description] = site_doc.css("section#contact-panel-content p.color-s3").text
    #rank
    site[:rank] = site_doc.css("section#traffic-rank-content strong.metrics-data").first.text.gsub(/[^0-9]/, '')
    #global use
    countries = site_doc.css("section#visitors-content table tbody tr").collect {|country| country.css("a").text[2..-1]}
    site[:top_users] = countries
    #metrics
    metrics = site_doc.css("section#engagement-content span.col-pad div strong").collect {|metric| metric.text.strip}
    site[:bounce_rate] = metrics[0]
    site[:page_views] = metrics[1]
    site[:time_on_site] = metrics[2]
    site
  end

end


site = Scraper.scrape_site_info("Learn.co")
puts site
# site = Scraper.scrape_site_info("Spotify.com")
# puts site
# site_2 = Scraper.scrape_site_info("Tumblr.com")
# puts site_2
# site_3 = Scraper.scrape_site_info("Mail.ru")
# puts site_3
# put site_3.description
