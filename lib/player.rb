class Player
attr_accessor :name, :points, :rebounds, :assists, :true_shooting
def initialize
@name=""
@points=0
@rebounds=0
@assists=0
@true_shooting=0
end
def get_points (arr)
arr.each {|point| points+=point}
points=points/arr.length
end
def get_rebounds (arr)
  arr.each {|rebound| rebounds+=rebound}
  rebounds=rebounds/arr.length
  end
  def get_assists (arr)
    arr.each {|assist| assists+=assist}
    assists=assists/arr.length
    end
    def get_shooting (arr)
      arr.each {|shooting| true_shooting+=shooting}
      true_shooting=true_shooting/arr.length
      end


end