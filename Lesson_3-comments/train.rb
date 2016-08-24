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

# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, 
# на основе маршрута
#  passenger

class Train

  attr_accessor :num,
                :type,
                :carriage,
                :speed,
                :current_station,
                :list_stations
                
  def initialize(num, type, carriage = 0, speed = 0)
    @num = num
    @type = type
    @carriage = carriage
    @speed = speed
    @list_stations = list_stations
    @current_station = current_station
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
  
  # attr_accessor :current_station, 
                # :list_stations
 
 # Маршрут, передача станций поезду

  def route_train(list_stations)
    @list_stations = list_stations

    # ***
    # Почему если не указать @list_stations = list_stations
    # в этом методе, а указать только в initialize,
    # то следующий код "self.current_station = self.list_stations[0]
    # "не работает?
    # ***

    self.current_station = self.list_stations[0]
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{list_stations.first} - #{list_stations.last}"
  end

  def next_station
     if self.current_station == self.list_stations.last
      puts "Это последняя станция"
    else
      next_station = self.list_stations[self.list_stations.index(self.current_station) + 1]
      puts "Следущая станция #{next_station}"
    end
  end

  def prev_station
    if self.current_station == self.list_stations.first
      puts "Это первая станция"
    else
      prev_station = self.list_stations[self.list_stations.index(self.current_station) - 1]
      puts "Предыдущая станция #{prev_station}"
    end
  end

# Премещения поезда между станциями

  def go_next_station
    self.current_station = self.list_stations[self.list_stations.index(self.current_station) + 1]
    puts "Поезд приехал на станцию #{self.current_station}"
    puts "Это конечная станция, можно ехать обратно" if self.current_station == self.list_stations.last
  end

  def go_prev_station
    self.current_station = self.list_stations[self.list_stations.index(self.current_station) - 1]
    puts "Поезд приехал на станцию #{self.current_station}"
    puts "Это первая станция, можно ехать только вперед" if self.current_station == self.list_stations.first
  end

end
