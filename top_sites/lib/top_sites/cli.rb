class TopSites::CLI

  def test
    puts "This test worked"
    sites = TopSites::Scraper.scrape_top_fifty_sites
    display_top_fifty_sites(sites)
  end

  def run
    test
    sites = self.get_top_fifty_sites
    self.display_top_fifty_sites(sites)
  end

  def

  def get_top_fifty_sites
    TopSites::Scraper.scrape_top_fifty_sites
  end

  def display_top_fifty_sites(sites)
    puts "~~~~~~~~~~~~~~~~~~ TOP 50 WEBSITES: GLOBAL RANKINGS ~~~~~~~~~~~~~~~~~~"
    sites.each_with_index do |site, i|
      if i < 9
        puts "                    #{i.to_i + 1}                             #{site}"
       else
        puts "                    #{i.to_i + 1}                            #{site}"

    end
    end
  end

  def display_site(site)
    puts "~~~~~~~~~~~~~~~ #{site.name} ~~~~~~~~~~~~~~~"
    puts ""
    puts "#{site.description}"
    puts "~~~~~~~~~~~~~~~ GLOBAL RANK ~~~~~~~~~~~~~~~"
     puts "Global Rank      #{site.rank}"
     puts ""
     puts "~~~~~~~~~~~~~~~ COUNTRIES WITH MOST USERS ~~~~~~~~~~~~~~~"
     puts ""
     puts "1.                  #{site.top_users[0]}"
     puts "2.                  #{site.top_users[1]}"
     puts "3.                  #{site.top_users[2]}"
     puts "4.                  #{site.top_users[3]}"
     puts "5.                  #{site.top_users[4]}"
     puts ""
     puts "~~~~~~~~~~~~~~~ METRICS ~~~~~~~~~~~~~~~"
     puts ""
     puts "Bounce Rate:                 #{site.bounce_rate}"
     puts "Daily Pageviews per Visitor: #{site.page_views}"
     puts "Daily Time on Site:          #{site.time_on_site}"
  end
end

# TopSites::CLI.new.run
# CLI.new.run
