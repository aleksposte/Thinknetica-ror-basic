# Усложненное задание: создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
#      - Создавать станции
#      - Создавать поезда
#      - Добавлять вагоны к поезду
#      - Отцеплять вагоны от поезда
#      - Помещать поезда на станцию
#      - Просматривать список станций и список поездов на станции



require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_carriage.rb'


class Control

attr_accessor :stations,
              :trains,
              :cargo_train,
              :passenger_train

def initialize
  @stations = []
  @trains = []
  @cargo_train = []
  @passenger_train = []

end

# Список действий
# Создать станцию
# Создать поезд
# добавить ванон к поезду
# Удалить вагон у поезда
# Добавить поезд на станцию
# Просмотреть список станций
# Просмотреть список поездов на станции

def print_choice
list = <<TEXT
  Укажите номер действия:
  Создать станцию - 1
  Создать поезд - 2
  Добавить вагон к поезду - 3
  Удалить вагон у поезда  - 4
  Добавить поезд на станцию - 5
  Просмотреть список станций - 6
  Просмотреть список поездов на станции - 7
  # Просмотреть список поездов на станции - 8
TEXT
puts list
end


def choice
  puts "Что вы хотите сделать?"
  action = gets.chomp
  case action
    when "1"
      new_station
    when "2"
      new_train
    when "3"
      new_passenger_train
    when "4"
      new_carriage
        when "5"
          when "6"
            when "7"
              when "8"
  end
  action = gets.chomp
  puts action
end


def new_station
  puts "Укажите имя станции:"
  name = gets.chomp
  station = Station.new(name)
  @stations.push(station)
  puts "Создана станция #{name}"
choice.print_choice
end

def new_train
  puts "Укажите тип поезда (cargo или passenger)"
  type = gets.chomp
  puts "Укажите номер поезда"
  num = gets.chomp
  if type == 'cargo'
    @trains.push(CargoTrain.new(num))
    puts "Создан поезд типа #{type} номер #{num}"
  elsif type == 'passenger'
    @trains.push(PassengerTrain.new(num))
    puts "Создан поезд типа #{type} номер #{num}"
  else
    puts "Такого типа поезда нет"
  end
choice.print_choice 
end

# Хотел сначала поезда сразу по типу разбить, но сильно много кода получается :(
# def new_cargo_train
#   puts "Укажите номер поезда"
#   num = gets.chomp
#   num = CargoTrain.new(num)
#   puts num.type
#   @cargo_train.push(num)
#   puts "Создан новый Грузовой поезд  #{num.num}"
#   choice.print_choice
# end

# def new_passenger_train
#   puts "Укажите номер поезда"
#   num = gets.chomp
#   passenger = PassengerTrain.new(num)
#   @passenger_train.push(passenger)
#   puts "Создан новый Пассажирский поезд  #{num}"
# end

# def new_carriage
#   puts "Укажите поезд"
#   num = gets.chomp
#   puts num.type
#   if n_train.type == 'cargo'
#     puts "Этот поезд - грузовой, к нему будет добавлен грузовой вагон"
#     carriage = CargoCarriage.new
#     self.carriages_all.push(carriage)
#   elsif n_train.type == 'passenger'
#     puts "Этот поезд - пассажирский, к нему будет добавлен пассажирский вагон"
#     carriage = PassengerCarriage.new
#     self.carriages_all.push(carriage)
#   else
#     puts "Такого поезда нет"
#   end
# end

# def add_carriage(carriage)
#     if @speed != 0
#       puts "Cначала остановите поезд!"
#     elsif  carriage.type != 'cargo'
#       puts "Это вагон не является Грузовым"
#     else
#       self.carriages_all.push(carriage)
#       puts "У поезда #{num} Грузовых вагонов: #{self.carriages_all.size}"
#     end
#   end
# loop do 
#       # @stations = []
#   puts "Создать станцию? (no)"
#   station_new = gets.chomp
#   break if station_new == 'no'
#     puts "Введите имя новой станции"
#       name = gets.chomp
#       station = Station.new(name)
#       @stations << station
#       puts @stations
# end



end


choice = Control.new
choice.print_choice
choice.choice
# choice.new_station