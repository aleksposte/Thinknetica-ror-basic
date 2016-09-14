class Train
 
  class << self; attr_accessor :trains end
  
  @trains = {}

end

class CargoTrain < Train

  @trains = { :a => 100 }

end

class PassengerTrain < Train

  @trains = { :b => 500 }

end

