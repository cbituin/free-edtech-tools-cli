require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
   
   def self.scrape_main_page(index_url)
       html = File.read(index_url)
       applications_page = Nokogiri::HTML(html)
       
       all_apps = []
    #   applications_page.css().each.do
    #   end
       binding.pry
       
       all_apps
       
   end
    
end

# applications_page.css("h2:nth-child(5)").text
# => "19 Free Tools To Create Infographics For Teachers "

# applications_page.css("h2:nth-child(7)").text
# => "19 Free Text To Speech Tools For Teachers"

# applications_page.css("h2:nth-child(9)").text
# => "21 Free Digital Storytelling Tools For Teachers"

# applications_page.css("h2:nth-child(11)").text
# => "15 Free Podcast Tools For Teachers"

# applications_page.css("h2:nth-child(13)").text
# => "27 Free Survey, Polls, and Quizzes Tools For Teachers"

# applications_page.css("h2:nth-child(15)").text
# => "17 Free Screen Capturing Tools For Teachers "

# applications_page.css("h2:nth-child(17)").text
# => "30 Free Social Bookmarking Tools For Teachers"