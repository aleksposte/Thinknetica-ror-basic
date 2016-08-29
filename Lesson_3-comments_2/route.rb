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

  attr_accessor :route

  def initialize(first, last)
    # Можно сразу объявить массив с элементами: [first, last].
    @route = [first, last]
  end

  def add_station(station)
    route.insert(-2, station)
    puts "В маршрут была добавлена станция #{station}"
  end

  def delete_station(station)
    # Хорошо бы проверять на удаление конечных станций.
    if station == self.route[0] || station == self.route.last
      puts "Это конечная станция, ее нельзя удалять!"
    else
      route.delete(station)
      puts "Из маршрута была удалена станция #{station}"
    end
  end

  # Если мы выводим станции, лучше сделать метод print_all_stations. Иначе метод чтения переопределяется и возникает путаница.

  def print_all_stations
    puts route 
  end

end