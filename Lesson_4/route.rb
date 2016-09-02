
class Route
# Исходя из такого использования, пожалуй, route в классе Route было лучше.
  attr_accessor :list_stations

  def initialize(first, last)
    @list_stations = [first, last]
  end

  def add_station(station)
    list_stations.insert(-2, station)
    puts "В маршрут была добавлена станция #{station}"
  end

  def delete_station(station)
    if station == @list_stations[0] || station == @list_stations.last
      puts "Это конечная станция, ее нельзя удалять!"
    else
      list_stations.delete(station)
      puts "Из маршрута была удалена станция #{station}"
    end
  end

  def print_all_stations
    puts list_stations 
  end

end