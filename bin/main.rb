require './lib/player'
require 'watir'
require 'nokogiri'
nba_player= Player.new
browser  = Watir::Browser.new
browser.goto("https://www.basketball-reference.com/")
until browser.link(xpath: "/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a").exists?
puts "Welcome to the basketball reference Scraper API"
puts "To begin please select the name of the player that you want to extract information from: (e.g Lebron James, Kevin Durant, Stephen Curry, etc)"
nba_player.name=gets.chomp

browser.text_field(name:"search").set nba_player.name

browser.button(type:"submit").click
sleep 0.5
unless browser.link(xpath: "/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a").exists?
puts "Please type the name of an nba player" 
gets.chomp
system('clear')

end
end
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
nba_player.points=per_game_array.map {|point| point[0]}
nba_player.assists=per_game_array.map {|assist| assist[1]}
nba_player.rebounds=per_game_array.map {|rebound| rebound[2]}
nba_player.true_shooting=per_game_array.map {|shooting| shooting[3]}
p nba_player.points
p nba_player.assists
p nba_player.rebounds
p nba_player.true_shooting
sleep 5
