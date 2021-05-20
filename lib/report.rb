require './lib/player'
class Report
  attr_accessor :season_avr, :last_ten, :player_condition

  def initialize
    @season_avr = []
    @last_ten = []
    @player_condition = 0
  end

  def report_averages(name, points, assists, rebounds, shooting)
    season_avr_arr(points, assists, rebounds, shooting)
    puts "Throughout the 2020-21 season, #{name} is averaging #{points} ppg, #{assists} assists,"
    puts "#{rebounds} rebounds while shooting #{(shooting * 100).round(2)}% from the field"
  end

  def report_last_ten(name, points, assists, rebounds, shooting)
    last_ten_arr(points, assists, rebounds, shooting)
    puts "During his last 10 games, #{name} is averaging #{points} ppg, #{assists} assists,"
    puts "#{rebounds} rebounds while shooting #{(shooting * 100).round(2)}% from the field."
  end

  def season_avr_arr(points, assists, rebounds, shooting)
    @season_avr = [points, assists, rebounds, shooting]
  end

  def last_ten_arr(points, assists, rebounds, shooting)
    @last_ten = [points, assists, rebounds, shooting]
  end

  def compare(season_avr, last_ten)
    point_diff = season_avr[0] - last_ten[0]
    assist_diff = season_avr[1] - last_ten[1]
    rebound_diff = season_avr[2] - last_ten[2]
    shooting_diff = season_avr[3] * 100 - last_ten[3] * 100
    difference = point_diff + assist_diff + rebound_diff + (shooting_diff / 3)
    @player_condition = if player_hot?(difference)
                          3
                        elsif player_cold?(difference)
                          1
                        else
                          2
                        end
  end

  def end_report(name)
    case @player_condition
    when 1
      puts "#{name} is currently having a cold streak, you probably shouldn't expect him to have huge numbers"
    when 2
      puts "#{name} is currently playing like he normally does"
    when 3
      puts "#{name} is on fire!!, he is a great pick to bet on and expect him to keep playing well"
    else
      puts 'No report at the moment'
    end
  end

  def player_hot?(comparison)
    return true if comparison < -5

    false
  end

  def player_cold?(comparison)
    return true if comparison > 5

    false
  end
end
