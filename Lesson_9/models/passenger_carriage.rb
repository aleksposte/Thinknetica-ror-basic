class PassengerCarriage < Carriage
  attr_reader :seats

  def initialize(capacity)
    @type = :passenger
    @capacity = capacity
    @seats = 0
  end

  def load(value)
    if @seats <= @capacity
      puts "Вы заняли мест #{value}, свободных осталось #{free_capacity}"
    else
      puts 'Мест больше нет'
    end
  end

  def free_capacity
    @capacity - @seats
  end
end
