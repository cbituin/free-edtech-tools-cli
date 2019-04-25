require 'pry'

class FreeEdtechTools::Edtech 
    
    attr_accessor :name, :category, :description, :url
    
    @@all = []
    
    def initialize(edtech_hash)
        @name = edtech_hash[:name]
        @category = edtech_hash[:category]
        @description = edtech_hash[:description]
        @url = edtech_hash[:url]
        @@all << self
    end

#TODO: It doesn't look like you're using `Edtech.create_from_collection`.. is that a relic or something you were on your way to using?  If you're not using it, might as well get rid of it.

    def self.create_from_collection(edtech_array)
        edtech_array.each do |app|
            self.new(app)
        end
    end
    
    def self.all
        @@all
    end
#replaced with addition to #initialize    
#    def add_attributes(edtech_hash)
#        self.description = edtech_hash[:description]
#        self.url = edtech_hash[:url]
#    end
    

#utilizing methods within Scraper
    # def filter(category)
    #     #returns desired values, but does not pass tests written
    #     self.all.select { |apps| apps.category == category }
    # end
    
end