class FavoriteFood
  attr_reader :timesEaten, :foods
  
  def initialize(times, foods)
    @timesEaten = times
    @foods = foods
  end
end
