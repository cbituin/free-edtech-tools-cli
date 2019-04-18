#CLI Controller

require 'pry'

class FreeEdtechTools::CLI
    
    def call
        FreeEdtechTools::Scraper.scrape_main_page("../../fixtures/index.html")
        welcome
        menu
        goodbye
    end

    def welcome
        puts "Welcome to The Best CLI Edtech Library on the Planet! What type of tool are you looking for today?"

        # category_choices = %Q(
        #     1. Create Infographics
        #     2. Digital Storytelling
        #     3. Survey, Polls, and Quizzes
        #     4. Screen Capturing
        #     5. Photo and Image Editing
        # ) 

        # puts category_choices

        binding.pry
    end

    def menu
        puts "This is the menu function"
        # input = nil

    end

    def goodbye
        puts "Goodbye [function]"
    end

end