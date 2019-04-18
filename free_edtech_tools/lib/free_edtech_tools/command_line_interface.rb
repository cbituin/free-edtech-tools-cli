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
        2.times {puts}
        
        puts "Welcome to The Best CLI Edtech Library on the Planet! Feel free to browse our #{FreeEdtechTools::Scraper.all_apps.count} apps!"
        puts "What type of tool are you looking for today?"
        
        2.times {puts}
        sleep(2)

        #TODO - add loop and fix formatting example => 1. Category
        #TODO - shorten time to display apps
        FreeEdtechTools::Scraper.all_cats.each { |app| 
            puts app
            sleep(0.5)
        }
        sleep(1)
        puts
    end

    def menu
        input = nil

        while input != "exit"
            puts "Enter #1-7 to make your selection. Type 'exit' to leave."
            input = gets.strip.to_i
            goodbye if input === "exit"
            
            selected_cat = FreeEdtechTools::Scraper.all_cats[input - 1]
            
            clear_screen
            2.times {puts}
            
            #TODO - potential for separation into different method; ex: #cats_menu vs #apps_menu
            i = 0
            FreeEdtechTools::Scraper.filter(selected_cat).map { |app|
                puts "#{i + 1}. #{app.name}"
                i+=1
                sleep(0.25)
            }
            
            2.times {puts} 

            puts "Enter the number of the app that you want more information on. Or type 'menu' to go back to the main menu."

            input = gets.strip.downcase
            goodbye if input === "exit"
            if input === "menu"
                clear_screen
                welcome
            else
                input = input.to_i
                selection = %Q(
Name: #{FreeEdtechTools::Scraper.filter(selected_cat)[input - 1].name}
                    
URL: #{FreeEdtechTools::Scraper.filter(selected_cat)[input - 1].url}
                    
Description: #{FreeEdtechTools::Scraper.filter(selected_cat)[input - 1].description}
                )
                puts selection
            end
            
            2.times {puts}
            sleep(2)

            puts "What would you like to do next?"
            puts
            puts "Type 'menu' to return to the main menu. Type 'exit' to leave."
            
            input = gets.strip.downcase

            case input
            when "menu"
                welcome
            when "exit"
                goodbye
            end
        end

    end

    def goodbye
        sleep(1)
        clear_screen
        puts "Thanks for exploring our collection of educational apps!"
    end

    def clear_screen
        system("clear")
        system("cls")
    end 
end