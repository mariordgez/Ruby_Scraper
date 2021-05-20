require './lib/player'
class Report
  attr_accessor :player, :season_avr, :last_ten
def initialize
@player=Player.new
@season_avr=[]
@last_ten=[]
end
def report_averages(name, points, assists, rebounds, shooting)
  season_avr_arr(points, assists, rebounds, shooting)
  puts "Throughout the 2020-21 season, #{name} is averaging #{points} ppg, #{assists} assists, #{rebounds} rebounds while shooting #{shooting*100}% from the field"
end
def report_last_ten(name, points, assists, rebounds, shooting)
  last_ten=[points, assists, rebounds, shooting]
  puts "During his last 10 games, #{name} is averaging #{points} ppg, #{assists} assists, #{rebounds} rebounds while shooting #{shooting*100}% from the field"
end
def season_avr_arr(points, assists, rebounds, shooting)
  season_avr=[points, assists, rebounds, shooting]
end
def last_ten_arr(points, assists, rebounds, shooting)
  last_ten=[points, assists, rebounds, shooting]
end
def compare(season_avr, last_ten)
point_diff=season_avr[0]-last_ten[0]
assist_diff=season_avr[1]-last_ten[1]
rebound_diff=season_avr[2]-last_ten[2]
shooting_diff=season_avr[3]*100-last_ten[3]*100
difference=point_diff+assist_diff+rebound_diff+shooting_diff/3
end

end