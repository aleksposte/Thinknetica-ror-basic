
class CargoTrain < Train
# Как используется этот аксессор?
# Никак, это я "поналепил" не подумав :(
# attr_accessor :cargo

  def initialize(num)
      super
      @type = :cargo
  end

end

