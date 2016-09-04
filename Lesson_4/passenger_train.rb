
class PassengerTrain < Train
# Как используется этот аксессор?
# Никак, это я "поналепил" не подумав :(
  # attr_accessor :passenger

  def initialize(num)
      super
      @type = :passenger
  end
  
end



