require 'open-uri'
require 'pry'
require 'nokogiri'

class FreeEdtechTools::Scraper   
    
    @@all_apps = []
    @@all_cats = []
   
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
            
#TODO: url is returning NoMethodError for 'value'
            applications_page.css("ol:nth-child(#{ol_counter}) li").each do |app|
                name = app.css("a").text.strip.gsub("\u00a0", "")
                description = app.text.gsub("#{app.css("a").text}", "").strip
                
                #TODO: apps are assigning to the wrong categories.
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
                @@all_apps << FreeEdtechTools::Edtech.new(
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
   
   def self.all_apps
       @@all_apps
   end
   
   def self.all_cats
       @@all_cats
   end

   def self.filter(category)
    self.all_apps.select { |apps| apps.category.to_s.downcase == category.to_s.downcase }
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


#<Nokogiri::XML::Element:0x14a68c4 name="li" children=[
#<Nokogiri::XML::Text:0x1719ae8 "\n">, 
#<Nokogiri::XML::Element:0x15f2ae8 name="a" attributes=[
#<Nokogiri::XML::Attr:0x164a9c8 name="href" value="https://live.amcharts.com/">, 

#<Nokogiri::XML::Attr:0x164a9b4 name="target" value="_blank">, 
#<Nokogiri::XML::Attr:0x164a9a0 name="rel" value="noopener">] children=[#<Nokogiri::XML::Text:0x164a16c "amCharts Visual Editor ">]>, 
#<Nokogiri::XML::Text:0x1719048 "This editor allows you to use amCharts as a web service. This means that all you need to do is to configure the chart and paste the generated HTML code to your HTML page.">]>

################

 #<Nokogiri::XML::Element:0x14a689c name="li" children=[
 #<Nokogiri::XML::Text:0x1718d00 "\n">, 
 #<Nokogiri::XML::Element:0x15f2ac0 name="a" attributes=[
#<Nokogiri::XML::Attr:0x164df4c name="href" value="http://chartsbin.com/about/apply">, 
#<Nokogiri::XML::Attr:0x164df38 name="target" value="_blank">, 
#<Nokogiri::XML::Attr:0x164df24 name="rel" value="noopener">] children=[#<Nokogiri::XML::Text:0x164d704 "ChartsBin">]>,
#<Nokogiri::XML::Text:0x1718260 "Create your own interactive map. It's free for now.">]>
