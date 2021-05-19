require 'watir'
require './lib/player'
require 'nokogiri'
nba_player= Player.new
puts "Welcome to the basketball reference Scraper API"
puts "To begin please select the name of the player that you want to extract information from: (e.g Lebron James, Kevin Durant, Stephen Curry, etc)"
nba_player.name=gets.chomp
browser  = Watir::Browser.new
browser.goto("https://www.basketball-reference.com/")
browser.text_field(name:"search").set nba_player.name

browser.button(type:"submit").click
browser.link(xpath: "/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a").click
season=browser.url.delete_suffix('.html')
season+='/gamelog/2021'
browser.goto(season)
docu = Nokogiri::HTML.parse(browser.html)
table1 = docu.css("table").sort {|x,y| y.css("tr").count<=> x.css("tr").count}.first
p table1
rows = table1.css("tr")
rows=rows.select {|row| row.css("th").empty?}
per_game_array=rows.map do |row|
  row.at_css("td:nth_child(28)").try(:text)
  row.at_css("td:nth_child(23)").try(:text)
  row.at_css("td:nth_child(22)").try(:text)
  row.at_css("td:nth_child(13)").try(:text)
end
per_game_array=per_game_array.reject {|nnil| nnil[0].nil?}
p per_game_array
sleep 5
