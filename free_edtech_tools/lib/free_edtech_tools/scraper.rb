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

    #   @sampletitle = "19 Free Tools To Create Infographics For Teachers"
    #   simple = short_cat_title(@sampletitle)
    
    #h2 counter => produces numbers to iterate through css for categories wanted (5, 7, 9, 11, 13, 15, 17)
        # h2_counter = 5
        # while h2_counter <= 17
        #     puts h2_counter
        #     h2_counter += 2
        # end
    
    #ol counter => produces numbers to iterate through css for applications wanted (6, 8, 10, 12, 14, 16, 18)
        # ol_counter = 6
        # while ol_counter <= 18
        #     puts ol_counter
        #     ol_counter += 2
        # end
    
    
    
    
       
       all_apps
       binding.pry
   end
   
   
   def self.short_cat_title(str)
       str.gsub(/(\w+ Free )|( For Teachers)/, "")
   end
   
end

# applications_page.css("h2:nth-child(5)").text
# => "19 Free Tools To Create Infographics For Teachers "
# applications_page.css("ol:nth-child(6) li").text


# applications_page.css("h2:nth-child(7)").text
# => "19 Free Text To Speech Tools For Teachers"
# applications_page.css("ol:nth-child(8) li").text   

# applications_page.css("h2:nth-child(9)").text
# => "21 Free Digital Storytelling Tools For Teachers"
# applications_page.css("ol:nth-child(10) li").text   

# applications_page.css("h2:nth-child(11)").text
# => "15 Free Podcast Tools For Teachers"
# applications_page.css("ol:nth-child(12) li").text   

# applications_page.css("h2:nth-child(13)").text
# => "27 Free Survey, Polls, and Quizzes Tools For Teachers"
# applications_page.css("ol:nth-child(14) li").text   


# applications_page.css("h2:nth-child(15)").text
# => "17 Free Screen Capturing Tools For Teachers "
# applications_page.css("ol:nth-child(16) li").text   


# applications_page.css("h2:nth-child(17)").text
# => "30 Free Social Bookmarking Tools For Teachers"
# applications_page.css("ol:nth-child(18) li").text   
