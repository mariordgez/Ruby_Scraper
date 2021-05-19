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
browser.link(text: '2020-21').click
sleep 3