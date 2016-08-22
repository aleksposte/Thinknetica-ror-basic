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

  def initialize(station_name)
    @station_name = station_name
    @trains = {}
    # @train_name = 0
    # @train_type = 0
    puts @station_name
  end

  def accept_train(train_name, train_type)
    @trains[train_name] = train_type
  end

  def depart_train(train_name)
    @trains.delete(train_name)
    puts "Со станции #{@station_name} отбыл поезд: #{train_name}"

    puts "На станции #{@station_name} остались поезда:"
      @trains.each_pair do |name, type|
        puts "#{name}, тип поезда: #{type} \n"
      end
  end

  def all_trains
    puts "На станции #{@station_name} находятся поезда:"
      @trains.each_pair do |name, type|
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
# list of stations
  def initialize(first_station, last_station)
    @list_stations = []
    @first_station = first_station
    @last_station = last_station
@list_stations = [@first_station]
    # @list_stations = [@first_station, @last_station]
    
    # puts @list_stations
  end

  def add_station(name_add_station)
    @add_station = name_add_station
    # @list_add_stations = []
    # @list_add_stations.push(@add_station)
@list_stations.push(@add_station)
  end

  def all_stations
    @list_all_stations = @list_stations.push(@last_station)
    puts @list_all_stations
    # @list_all_stations = []
    # @list_all_stations << @list_add_stations
    # # @list_all_stations << @first_station << @add_stations << @last_station
    # puts @list_all_stations
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