class Player
  attr_accessor :name, :points, :rebounds, :assists, :true_shooting, :last_ten_points, :last_ten_rebounds , :last_ten_assists, :last_ten_shooting

  def initialize
    @name = ''
    @points = []
    @rebounds = []
    @assists = []
    @true_shooting = []
    @last_ten_points=[]
    @last_ten_rebounds=[]
    @last_ten_assists=[]
    @last_ten_shooting=[]
  end

  def get_points(arr)
    total_points = 0
    arr.each { |point| total_points += point }
    total_points /= arr.length
  end

  def get_rebounds(arr)
    total_rebounds = 0
    arr.each { |rebound| total_rebounds += rebound }
    total_rebounds /= arr.length
  end

  def get_assists(arr)
    total_assists = 0
    arr.each { |assist| total_assists += assist }
    total_assists /= arr.length
  end

  def get_shooting(arr)
    total_shooting = 0
    arr.each { |shooting| total_shooting += shooting }
    total_shooting /= arr.length
  end
end
