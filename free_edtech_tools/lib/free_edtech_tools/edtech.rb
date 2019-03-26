# require 'open-uri'
require 'pry'
# require 'nokogiri'

class Edtech 
    
    attr_accessor :name, :category, :description, :url
    
    @@all = []
    
    def initialize(edtech_hash)
        @name = edtech_hash[:name]
        @category = edtech_hash[:category]
        @@all << self
    end
    
    def self.create_from_collection(edtech_array)
        edtech_array.each do |app|
            self.new(app)
        end
    end
    
    def add_attributes(edtech_hash)
        self.description = edtech_hash[:description]
        self.url = edtech_hash[:url]
    end
    
    def self.all
        @@all
    end
    
    def self.filter_by_category(category)
        #returns desired values, but does not pass tests written
        self.all.select { |apps| apps.category == category }
    end
    
end