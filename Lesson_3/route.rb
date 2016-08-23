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