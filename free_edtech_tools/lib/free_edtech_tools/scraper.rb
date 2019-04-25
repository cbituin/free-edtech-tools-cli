require 'open-uri'
require 'pry'
require 'nokogiri'

class FreeEdtechTools::Scraper   
    
    @@all_cats = []
#TODO: 3.  The above changes will mean you'll need to refactor `CLI`.  Really, scraper methods should be invoked only to scrape and get info that is used to populate instances of `Edtech`.. then we should refer to `Edtech` and its methods to get the information we want.. in other words, `Scraper` methods shouldn't be returning anything valuable, but rather just build and/or update `Edtech` objects.

   def self.scrape_main_page(index_url)
       html = open(index_url)
       applications_page = Nokogiri::HTML(html)

    #h2 counter => produces numbers to iterate through css for categories wanted (5, 7, 9, 11, 13, 15, 17)
        h2_counter = 5
        while h2_counter <= 17
            @@all_cats << self.short_cat_title(applications_page.css("h2:nth-child(#{h2_counter})").text.strip)
            h2_counter += 2
        end

    # ol counter => produces numbers to iterate through css for applications wanted (6, 8, 10, 12, 14, 16, 18)
        ol_counter = 6
        while ol_counter <= 18 
            # @@all_apps << applications_page.css("ol:nth-child(#{ol_counter}) li").text
            
            applications_page.css("ol:nth-child(#{ol_counter}) li").each do |app|
                name = app.css("a").text.strip.gsub("\u00a0", "")
                description = app.text.gsub("#{app.css("a").text}", "").strip
                
                #["Tools To Create Infographics", "Text To Speech Tools", "Digital Storytelling Tools", "Podcast Tools", "Survey, Polls, and Quizzes Tools", "Screen Capturing Tools", "Social Bookmarking Tools"]
                case ol_counter
                when 6
                    category = @@all_cats[0]
                when 8
                    category = @@all_cats[1]
                when 10
                    category = @@all_cats[2]
                when 12
                    category = @@all_cats[3]
                when 14
                    category = @@all_cats[4]
                when 16
                    category = @@all_cats[5]
                when 18
                    category = @@all_cats[6]
                end


                url = app.css("a").attribute("href") #.value

                # binding.pry                
                FreeEdtechTools::Edtech.new(
                :name => name, 
                :description => description, 
                :category => category, 
                :url => url
                ) 
            end
            ol_counter += 2
        end
    # binding.pry
   end
   
   def self.short_cat_title(str)
       str.gsub(/(\w+ Free )|( For Teachers)/, "").gsub("\u00a0", "")
   end
   
   def self.all_cats
       @@all_cats
   end
   
end