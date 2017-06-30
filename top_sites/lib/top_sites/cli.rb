class TopSites::CLI

  def confusion
    puts "I'm sorry, I didn't understand that."
    sleep(3)
    start
  end

  def exit_program
    puts "Thanks for using Top Sites!"
    exit
  end

  def display_top_fifty_sites(sites)
    puts "~~~~~~~~~~~~~~~~~~ TOP 50 WEBSITES: GLOBAL RANKINGS ~~~~~~~~~~~~~~~~~~"
    sites.each_with_index do |site, i|
      if i < 9
        puts "                    #{i.to_i + 1}                             #{site.name}"
       else
        puts "                    #{i.to_i + 1}                            #{site.name}"
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

  def start
    puts ""
    sites = TopSites::Scraper.scrape_top_fifty_sites
    display_top_fifty_sites(sites)
    puts ""
    puts "Would you like to learn more about one of these websites?"
    puts "Enter the ranking of the website you'd like to read more about"
    puts "or enter 'exit' to exit the program."
    input = gets.chomp
    if input == "exit"
      exit_program
    end
    input = input.to_i
    if input <= 50 && input > 0
      sites[input - 1].update_attributes(TopSites::Scraper.scrape_site_info(sites[input - 1].name))
      display_site(sites[input - 1])
      puts ""
      puts "Would you like to learn about another site? Y/N"
      input = gets.chomp.downcase
      if input == "y"
        start
      else input == "n"
        exit_program
      end
    else
      confusion
    end
  end


    def run
      start
    end
end
