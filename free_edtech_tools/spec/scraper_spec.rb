require "spec_helper.rb"

describe "Scraper" do

    let!(:app_index_array) {[
        {:name=>"amCharts Visual Editor", :category=>"Create Infographics", :description=>" This editor allows you to use amCharts as a web service. This means that all you need to do is to configure the chart and paste the generated HTML code to your HTML page.", :url=>"https://live.amcharts.com/?utm_campaign=elearningindustry.com"},
        {:name=>"ChartsBin", :category=>"Create Infographics", :description=>"Create your own interactive map. It's free for now.", :url=>"http://chartsbin.com/about/apply?utm_campaign=elearningindustry.com"},
        {:name=>"Easel.ly", :category=>"Create Infographics", :description=>"Create and share visual ideas online. Vhemes are visual themes. Drag and drop a vheme onto your canvas for easy creation of your visual idea!", :url=>"https://www.easel.ly/?utm_campaign=elearningindustry.com"}
        ]}
     
    describe "#scrape_main_page"  do
       it "is a class method that collects all the main data from the website and returns an array of hashes where each hash represents one application" do
           
           index_url = "./fixtures/index.html"
           scraped_apps = Scraper.scrape_main_page(index_url)
           expect(scraped_apps).to be_a(Array)
           expect(scraped_apps.first).to have_key(:name)
           expect(scraped_apps.first).to have_key(:category)
           expect(scraped_apps.first).to have_key(:description)
           expect(scraped_apps.first).to have_key(:url)
           expect(scraped_apps).to include(app_index_array[0], app_index_array[1])
       end
       
    end
    
end