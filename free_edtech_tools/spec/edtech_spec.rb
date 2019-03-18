require "spec_helper.rb"

describe "Edtech" do
    let!(:edtech_index_array) {[
        {:name=>"App # 1", :category=>"Create Infographics"},
        {:name=>"App # 2", :category=>"Digital Storytelling"},
        {:name=>"App # 3", :category=>"Screen Capturing"},
        {:name=>"App # 4", :category=>"Testing and Quizzing"},
        {:name=>"App # 5", :category=>"Sticky Notes"}
        ]}
        
    let!(:edtech_hash) {{
        :description=>"This is a description for the app.",
        :url=>"https://www.thisisafakeurlhopefully.com/appdetails"
        }}
        
    let!(:edtech) {Edtech.new({:name=>"App # 1", :category=>"Create Infographics"
    })}
    
    after(:each) do 
        Edtech.class_variable_set(:@@all, [])
    end
    
    describe "#new" do
    #take in arg (hash) to create a new ed tech app using kv pairs
        it "takes in an argument of a hash and sets app attributes to the key/value pairs provided" do
            expect{Edtech.new({:name=>"New Test App", :category=>"Test Category"})}.to_not raise_error
            expect(edtech.name).to eq("App # 1")
            expect(edtech.category).to eq("Create Infographics")
        end
        
    #add the edtech app to app collection
        it "add the new app to a collection of known apps" do
            expect(Edtech.class_variable_get(:@@all).first.name).to eq("App # 1")
        end
    end
    
    describe ".create_from_collection" do
    #create a collection of apps using scraper class
        it "uses the Scraper class to create a collection of known apps with a name and category" do
            #resets @@all to empty array to test for newly created collection
            Edtech.class_variable_set(:@@all, [])
            Edtech.create_from_collection(edtech_index_array)
            expect(Edtech.class_variable_get(:@@all).first.name). to eq("App # 1")
        end
    end
    
    describe "#add_attributes" do
    #allows for edtech apps to have additional attributes for future uses
        it "uses the Scraper class to get a collection of apps and uses a hash to set additional attributes for that app" do
            edtech.add_attributes(edtech_hash)
            expect(edtech.description).to eq("This is a description for the app.")
            expect(edtech.url).to eq("https://www.thisisafakeurlhopefully.com/appdetails")
        end
    end
    
    describe ".all" do
    #lists the collection of apps currently known
        it "returns the collection of app via the class variable @@all" do
            Edtech.class_variable_set(:@@all, [])
            expect(Edtech.all).to contain_exactly()
        end
    end
    
    describe ".filter_by_category" do
    #returns an array of apps based on category selected (user input)
        it "returns a collection of apps based on a category selected by the user" do
            expect(Edtech.filter_by_category("Create Infographics")).to include(:name=>"App # 1")
        end
    end
end