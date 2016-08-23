# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) 
# и количество вагонов, эти данные указываются при создании 
# экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)

# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, 
#   метод просто увеличивает или уменьшает количество вагонов). 
# Прицепка/отцепка вагонов может осуществляться 
# только если поезд не движется.

class Train

  attr_accessor :speed,
                :carriage

  def initialize(num, type, carriage = 0, speed = 0)
    @num = num
    @type = type
    @carriage = carriage
    @speed = speed
  end

# Скорость поезда
  def go=(speed)
    self.speed = speed
  end

  def stop
    self.speed = 0
  end

  def current_speed
    puts speed
  end

# Вагоны

  def add_carriage
    if speed != 0
      puts "Cначала остановите поезд!"
    else 
      self.carriage += 1
    end
  end

  def delete_carriage
    if speed != 0
      puts "Cначала остановите поезд!"
    else 
      self.carriage -= 1
    end
  end

  def all_carriage
    puts carriage
  end

# Маршрут следования

# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, 
# на основе маршрута
#  passenger
  def all_stations(all_stations)
    @train_route = [all_stations]
    puts @train_route
  end

end