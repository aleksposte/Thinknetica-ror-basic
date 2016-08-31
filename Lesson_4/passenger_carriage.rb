# Вагоны

# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 

class PassengerCarriage
 
 attr_accessor :type

  def initialize
    @type = 'passenger'
  end
end