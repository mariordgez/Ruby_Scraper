require './lib/player'
require './lib/report'
require 'watir'
require 'nokogiri'
nba_player = Player.new
nba_report = Report.new
puts 'Welcome to the basketball reference Scraper API'
puts 'select the name of the player that you want to extract information from: (e.g Lebron James, Kevin Durant)'
nba_player.name = gets.chomp
browser = Watir::Browser.new
browser.goto('https://www.basketball-reference.com/')
until browser.link(xpath: '/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a').exists?

  browser.text_field(name: 'search').set nba_player.name

  browser.button(type: 'submit').click
  sleep 0.5
  next if browser.link(xpath: '/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a').exists?

  puts 'Please type the name of an nba player'
  nba_player.name = gets.chomp
  system('clear')

end
browser.link(xpath: '/html/body/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/strong/a').click
season = browser.url.delete_suffix('.html')
season += '/gamelog/2021'
sleep 0.5
browser.goto(season)
docu = Nokogiri::HTML.parse(browser.html)
table1 = docu.css('table').min { |x, y| y.css('tr').count <=> x.css('tr').count }
rows = table1.css('tr')
rows = rows.reject { |row| row.css('th').text.to_i.zero? }
per_game_array = rows.map do |row|
  [String.try_convert(row.at_css('td:nth-child(28)')),
   String.try_convert(row.at_css('td:nth-child(23)')),
   String.try_convert(row.at_css('td:nth-child(22)')),
   String.try_convert(row.at_css('td:nth-child(13)'))]
end
per_game_array = per_game_array.reject { |n| n[0].nil? }
nba_player.points = per_game_array.map { |point| point[0] }
nba_player.assists = per_game_array.map { |assist| assist[1] }
nba_player.rebounds = per_game_array.map { |rebound| rebound[2] }
nba_player.true_shooting = per_game_array.map { |shooting| shooting[3] }
nba_player.points = nba_player.points.map(&:to_i)
nba_player.assists = nba_player.assists.map(&:to_i)
nba_player.rebounds = nba_player.rebounds.map(&:to_i)
nba_player.true_shooting = nba_player.true_shooting.map(&:to_f)
per_game_array.length.times do |i|
  next unless i > (per_game_array.length - 11)

  nba_player.last_ten_points.push(nba_player.points[i])
  nba_player.last_ten_assists.push(nba_player.assists[i])
  nba_player.last_ten_rebounds.push(nba_player.rebounds[i])
  nba_player.last_ten_shooting.push(nba_player.true_shooting[i])
end

ppg = nba_player.get_points(nba_player.points)
ast = nba_player.get_assists(nba_player.assists)
reb = nba_player.get_rebounds(nba_player.rebounds)
fg = nba_player.get_shooting(nba_player.true_shooting)
latest_ppg = nba_player.get_points(nba_player.last_ten_points)
latest_ast = nba_player.get_assists(nba_player.last_ten_assists)
latest_reb = nba_player.get_rebounds(nba_player.last_ten_rebounds)
latest_fg = nba_player.get_shooting(nba_player.last_ten_shooting)
nba_report.report_averages(nba_player.name, ppg, ast, reb, fg)
nba_report.report_last_ten(nba_player.name, latest_ppg, latest_ast, latest_reb, latest_fg)
nba_report.compare(nba_report.season_avr, nba_report.last_ten)
nba_report.end_report(nba_player.name)
gets.chomp
