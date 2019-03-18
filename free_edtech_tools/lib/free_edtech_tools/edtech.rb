require 'open-uri'
require 'pry'
require 'nokogiri'

class Edtech 
    
    attr_accessor :name, :category
    
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
    end
    
    

end