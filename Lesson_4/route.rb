
class Route
# Исходя из такого использования, пожалуй, route в классе Route было лучше.
  attr_accessor :route

  def initialize(first, last)
    @route = [first, last]
  end

  def add_station(station)
    route.insert(-2, station)
    puts "В маршрут была добавлена станция #{station}"
  end

  def delete_station(station)
    if station == @route[0] || station == @route.last
      puts "Это конечная станция, ее нельзя удалять!"
    else
      route.delete(station)
      puts "Из маршрута была удалена станция #{station}"
    end
  end

  def print_all_stations
    puts route 
  end

end