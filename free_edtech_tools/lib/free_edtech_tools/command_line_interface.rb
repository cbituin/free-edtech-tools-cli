#CLI Controller

require 'pry'

class FreeEdtechTools::CLI
    
    def call
        FreeEdtechTools::Scraper.scrape_main_page("https://elearningindustry.com/321-free-tools-for-teachers-free-educational-technology")        
        welcome
        menu
        goodbye
    end

    def welcome
        puts "Welcome to The Best CLI Edtech Library on the Planet! Feel free to browse our #{FreeEdtechTools::Scraper.all_apps.count} apps!"
        puts "What type of tool are you looking for today?"

        sleep(3)

        FreeEdtechTools::Scraper.all_cats.each { |app| puts app; sleep(1)}
        sleep(1)
    end

    def menu
        input = nil
        while input != "exit"
            puts "Enter #1-7 to make your selection. Type 'exit' to leave."
            
        end

    end

    def goodbye
        binding.pry
        puts "Goodbye [function]"
    end

end