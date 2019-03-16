require "free_edtech_tools/version"

# module FreeEdtechTools
#   # Your code goes here...
# end

require 'open-uri'
require 'nokogiri'
require 'pry'

require_relative './free_edtech_tools/version.rb'
require_relative './free_edtech_tools/edtech.rb'
require_relative './free_edtech_tools/command_line_interface.rb'

=begin

Welcome to The Best CLI Edtech Library on the Planet!
What type of tool are you looking for today?
1. Create Infographics
2. Digital Storytelling
3. Survey, Polls, and Quizzes
4. Screen Capturing
5. Photo and Image Editing
Enter the number of the category you would like to explore.

[Accepts user choice] #example: 1

Create Infographics
1. amCharts Visual Editor -  This editor allows you to use amCharts as a web service. This means that all you need to do is to configure the chart and paste the generated HTML code to your HTML page.
2. ChartsBinCreate -  your own interactive map. It's free for now.
3. DipityCreate -  an interactive, visually engaging timeline in minutes. Use dynamic visualization tools to display photos, videos, news and blogs in chronological order.
4. Easel.lyCreate -  and share visual ideas online. Vhemes are visual themes. Drag and drop a vheme onto your canvas for easy creation of your visual idea!
5. GapminderGapminder -  is used in classrooms around the world to build a fact-based world view.
Enter the number of the application for the information you would like to view.

[Accepts user choice] #example: 1

Are you sure you would like to view #{edtech.name}? (Yes/No)

[Accepts user choice] #example: 

#yes
Great! Loading the website for #{edtech.name}.
[Loads website]
[Restarts program]

#no 
Okay, what would you like to do?
1. Select a different option
2. Start over
3. Quit

=end
