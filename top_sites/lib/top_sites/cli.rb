require_relative "./scraper.rb"
require_relative "./site.rb"

class CLI

  def run
    display_top_fifty_sites(get_top_fifty_sites)
  
  end

  def

  def get_top_fifty_sites
    Scraper.scrape_top_fifty_sites
  end

  def display_top_fifty_sites(sites)
    puts "~~~~~~~~~~~~~~~~~~ TOP 50 WEBSITES: GLOBAL RANKINGS ~~~~~~~~~~~~~~~~~~"
    sites.each_with_index do |site, i|
      puts "                    #{i.to_i + 1}                            #{site}"
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


CLI.new.run
