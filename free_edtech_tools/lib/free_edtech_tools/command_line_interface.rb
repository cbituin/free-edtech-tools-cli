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
        clear_screen
        2.times {puts}
        
        puts "Welcome to The Best CLI Edtech Library on the Planet! Feel free to browse our #{FreeEdtechTools::Edtech.all.count} apps!"
        puts "What type of tool are you looking for today?"
        
        2.times {puts}
        sleep(2)

        FreeEdtechTools::Scraper.all_cats.each_with_index { |app, index| 
            puts "#{index+=1}. #{app}"
            sleep(0.25)
        }
        sleep(1)
        puts
    end

    def menu
        inputcat = nil

        while inputcat != "exit"
            puts "Enter #1-7 to make your selection. Type 'exit' to leave."
            inputcat = gets.strip.to_i
            goodbye if inputcat === "exit"
            # menu if inputcat
            if inputcat <= 0 || inputcat > 7
                welcome
            else

            selected_cat = FreeEdtechTools::Scraper.all_cats[inputcat - 1]
            
            2.times {puts}
            
            i = 0
            clear_screen
            FreeEdtechTools::Edtech.filter(selected_cat).map { |app|
                puts "#{i + 1}. #{app.name}"
                i+=1
                sleep(0.25)
            }
            
            2.times {puts} 
            end
            
            #TODO - potential for separation into different method; ex: #cats_menu vs #apps_menu
        
            puts "Enter the number of the app that you want more information on. Or type 'menu' to go back to the main menu."
            input = gets.strip.downcase
            goodbye if input === "exit"
            welcome if input === "menu"

            input = input.to_i
            if input <= 0 || input > FreeEdtechTools::Edtech.filter(selected_cat).count
                welcome
            else
                selection = %Q(
Name: #{FreeEdtechTools::Edtech.filter(selected_cat)[input - 1].name}
                    
URL: #{FreeEdtechTools::Edtech.filter(selected_cat)[input - 1].url}
                    
Description: #{FreeEdtechTools::Edtech.filter(selected_cat)[input - 1].description}
                )
                puts selection
            end
            
            2.times {puts}
            sleep(2)

            puts "What would you like to do next?"
            puts
            puts "Type 'menu' to return to the main menu. Type 'exit' to leave."
            
            inputnext = gets.strip.downcase

            case inputnext
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
        5.times {puts}
        puts "Thanks for exploring our collection of educational apps!"
        sleep(2)
        clear_screen
        exit
    end

    def clear_screen
        system("clear")
        system("cls")
    end 
end