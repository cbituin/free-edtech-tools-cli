require "spec_helper.rb"

describe "Edtech" do
    let!(:edtech_index_array) {[
        {:name=>"App # 1", :category=>"Create Infographics", :description=>"This app creates infographics.", :url=>"https://www.google.com/app#1"},
        {:name=>"App # 2", :category=>"Digital Storytelling", :description=>"This app tells stories digitally.", :url=>"https://www.google.com/app#2"},
        {:name=>"App # 3", :category=>"Screen Capturing", :description=>"This app captures a screen.", :url=>"https://www.google.com/app#3"},
        {:name=>"App # 4", :category=>"Testing and Quizzing", :description=>"This app tests and quizzes you.", :url=>"https://www.google.com/app#4"},
        {:name=>"App # 5", :category=>"Sticky Notes", :description=>"This app creates sticky notes.", :url=>"https://www.google.com/app#5"}
        ]}
        
    let!(:edtech_hash) {{
        :category=>"Generic Category",
        :description=>"This is a description for the app.",
        :url=>"https://www.thisisafakeurlhopefully.com/appdetails"
        }}
        
    let!(:edtech) {Edtech.new({:name=>"New Edtech App", :category=>"Edtech Category"
    })}
    
    after(:each) do 
        Edtech.class_variable_set(:@@all, [])
    end
    
    describe "#new" do
    #take in arg (hash) to create a new ed tech app using kv pairs
        it "takes in an argument of a hash and sets app attributes to the key/value pairs provided" do
            expect{Edtech.new({:name=>"New Test App", :category=>"Test Category"})}.to_not raise_error
            expect(edtech.name).to eq("New Edtech App")
            expect(edtech.category).to eq("Edtech Category")
        end
        
    #add the edtech app to app collection
        it "add the new app to a collection of known apps" do
            expect(Edtech.class_variable_get(:@@all).first.name).to eq("New Test App")
        end
    end
    
    describe ".create_from_collection" do
    #create a collection of apps using scraper class
    
    end
    
    describe "#add_attributes" do
    #allows for edtech apps to have additional attributes for future uses
        
    end
    
    describe ".all" do
    #lists the collection of apps currently known
    
    end
    
end