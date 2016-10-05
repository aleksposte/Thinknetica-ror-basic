
class CargoTrain < Train
  @trains = {}

  def initialize(num)
    super
    @type = :cargo
  end
end
