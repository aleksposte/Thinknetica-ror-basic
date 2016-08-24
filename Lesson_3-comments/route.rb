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
    # @first_station = first_station
    # @last_station = last_station
    list_stations.push(first_station)
    list_stations.push(last_station )
  end

  def add_station(name_add_station)
    list_stations.insert(-2, name_add_station)
    # puts list_stations
  end

  def delete_station(name_delete_station)
    list_stations.delete(name_delete_station)
    # puts list_stations
  end

  def all_stations
    puts list_stations
  end

end
