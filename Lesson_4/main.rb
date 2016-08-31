# Усложненное задание: создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
#      - Создавать станции
#      - Создавать поезда
#      - Добавлять вагоны к поезду
#      - Отцеплять вагоны от поезда
#      - Помещать поезда на станцию
#      - Просматривать список станций и список поездов на станции


require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

class Control
#      - Создавать станции
attr_accessor :stations
def initioalize
@stations = []

end

loop do 
      @stations = []
  puts "Создать станцию? (no)"
  station_new = gets.chomp
  break if station_new == 'no'
    puts "Введите имя новой станции"
      name = gets.chomp
      station = Station.new(name)
      @stations << station
      puts @stations
end



end