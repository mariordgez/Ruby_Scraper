require './lib/player'
class Report
  attr_accessor :player
def initialize
@player=Player.new
end
def report_averages(name, points, assists, rebounds, shooting)
  puts "Throughout the 2020-21 season, #{name} is averaging #{points} ppg, #{assists} assists, #{rebounds} rebounds while shooting #{shooting*100}% from the field"
end
end