# Требуется написать следующие классы:

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может показывать список всех поездов на станции, 
# находящиеся в текущий момент
# Может показывать список поездов на станции по типу 
# (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, 
# поезд удаляется из списка поездов, находящихся на станции).

class Station

  attr_accessor :station_name, 
                :trains
             
  def initialize(station_name)
    @trains = {}
    puts station_name
  end

  def accept_train(train_name, train_type)
    self.trains[train_name] = train_type
  end

  def depart_train(train_name)
    trains.delete(train_name)
      puts "Со станции #{station_name} отбыл поезд: #{train_name}"

    puts "На станции #{station_name} остались поезда:"
      trains.each_pair do |name, type|
        puts "#{name}, тип поезда: #{type} \n"
      end
  end

  def all_trains
    puts "На станции #{station_name} находятся поезда:"
      trains.each_pair do |name, type|
        puts "#{name}, тип поезда: #{type} \n"
      end
  end

end

# Класс Route (Маршрут):
# Имеет начальную 
# и конечную станцию, а также список промежуточных станций. 
# Начальная и конечная станции указываютсся при создании маршрута, 
# а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной 
# до конечной


class Route

  attr_accessor :list_stations,
                :last_station,
                :all_stations

  def initialize(first_station, last_station)
    @list_stations = []
    @first_station = first_station
    @last_station = last_station 
    # почему, если убрать определение @last_station- то 
    # all_stations, в  значении последней стании ничкго не выводит???
    list_stations.push(first_station)
  end

  def add_station(name_add_station)
    # @add_station = name_add_station
    list_stations.push(name_add_station)
    puts list_stations
  end

  def delete_station(name_delete_station)
    # @delete_station = name_delete_station
    list_stations.delete(name_delete_station)
    puts list_stations
  end

  def all_stations
    all_stations = list_stations.push(last_station)
    puts all_stations
  end

end

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
  def route_train(route)
    @route = route
    @all_stations = []
    @current_station = route.all_stations[0]
    puts @current_station
  end




end
