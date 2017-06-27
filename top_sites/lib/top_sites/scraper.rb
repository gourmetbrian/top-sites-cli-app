class TopSites::Scraper

  SITE_BASE_URL = "http://www.alexa.com/siteinfo/"
  TOP_SITES_URL = "http://www.alexa.com/topsites"

  def self.scrape_top_fifty_sites
    TopSites::Scraper.get_page.css("div.listings.table div.site-listing div.DescriptionCell").collect do |site|
      new_site = {}
      new_site[:name] = site.css("p").text.strip
      TopSites::Site.new(new_site)
    end
  end

  def self.get_page
    Nokogiri::HTML(open(TOP_SITES_URL))
  end

  def self.scrape_site_info(url)
    #create a site hash
    site = {}
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
