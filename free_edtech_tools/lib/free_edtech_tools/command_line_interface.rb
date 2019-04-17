require 'pry'

class CLI
    
    def call
        welcome
        menu
        goodbye
    end

    def welcome

        puts "Welcome to The Best CLI Edtech Library on the Planet! What type of tool are you looking for today?"

        category_choices = %Q(
            1. Create Infographics
            2. Digital Storytelling
            3. Survey, Polls, and Quizzes
            4. Screen Capturing
            5. Photo and Image Editing
        ) 

        puts category_choices

    end

    def menu
        input = nil

    end

    def goodbye
        
    end

end
