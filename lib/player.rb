class Player
  attr_accessor :name, :points, :rebounds, :assists, :true_shooting, :last_ten_points, :last_ten_rebounds,
                :last_ten_assists, :last_ten_shooting

  def initialize
    @name = ''
    @points = []
    @rebounds = []
    @assists = []
    @true_shooting = []
    @last_ten_points = []
    @last_ten_rebounds = []
    @last_ten_assists = []
    @last_ten_shooting = []
  end

  def averages(arr)
    total = 0
    arr.each { |val| total += val }
    total /= arr.length
  end
end
