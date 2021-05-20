require './lib/player'
require 'watir'
require 'nokogiri'
nba_player= Player.new
puts "Welcome to the basketball reference Scraper API"
puts "To begin please select the name of the player that you want to extract information from: (e.g Lebron James, Kevin Durant, Stephen Curry, etc)"
nba_player.name=gets.chomp
browser  = Watir::Browser.new
browser.goto("https://www.basketball-reference.com/")
browser.text_field(name:"search").set nba_player.name

browser.button(type:"submit").click
sleep 0.5
browser.link(xpath: "/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a").click
season=browser.url.delete_suffix('.html')
season+='/gamelog/2021'
sleep 0.5
browser.goto(season)
docu = Nokogiri::HTML.parse(browser.html)
table1 = docu.css("table").sort {|x,y| y.css("tr").count<=> x.css("tr").count}.first
rows = table1.css("tr")
rows=rows.select {|row| row.css("th").text.to_i != 0}
per_game_array=rows.map do |row|
  [String.try_convert(row.at_css("td:nth-child(28)")),
  String.try_convert(row.at_css("td:nth-child(23)")),
  String.try_convert(row.at_css("td:nth-child(22)")),
  String.try_convert(row.at_css("td:nth-child(13)"))]
end
per_game_array=per_game_array.reject {|n| n[0].nil?}
p per_game_array
sleep 5
