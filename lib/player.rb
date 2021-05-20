class Player
attr_accessor :name, :points, :rebounds, :assists, :true_shooting
def initialize
@name=""
@points=[]
@rebounds=[]
@assists=[]
@true_shooting=[]
end
def get_points (arr)
  total_points=0
arr.each {|point| total_points+=point}
total_points=total_points/arr.length
end
def get_rebounds (arr)
  total_rebounds=0
  arr.each {|rebound| total_rebounds+=rebound}
  total_rebounds=total_rebounds/arr.length
  end
  def get_assists (arr)
    total_assists=0
    arr.each {|assist| assists+=assist}
    total_assists=total_assists/arr.length
    end
    def get_shooting (arr)
      total_shooting
      arr.each {|shooting| total_shooting+=shooting}
      total_shooting=total_shooting/arr.length
      end


end