class CargoCarriage
  attr_reader :volume

  def initialize(capacity)
    @type = :cargo
    @capacity = capacity
    @volume = 0
  end

  def load(value)
    if value <= @capacity
      puts "Вы заняли объем #{value}, свободно осталось #{free_capacity}"
    else
      puts 'Места больше нет'
    end
  end

  def free_capacity
    @capacity - @volume
  end
end
