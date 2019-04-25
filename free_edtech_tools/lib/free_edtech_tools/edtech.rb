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

    def self.all
        @@all
    end

    def self.filter(category)
        self.all.select { |apps| apps.category.to_s.downcase == category.to_s.downcase }
    end
end