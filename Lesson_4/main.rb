# Усложненное задание: создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
#      - Создавать станции
#      - Создавать поезда
#      - Добавлять вагоны к поезду
#      - Отцеплять вагоны от поезда
#      - Помещать поезда на станцию
#      - Просматривать список станций и список поездов на станции


require_relative 'menu.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
require_relative 'carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'


class Controller

attr_accessor :stations,
              :trains

def initialize
  @stations = []
  @trains = []
  # @cargo_train = []
  # @passenger_train = []
end

def start
  loop do
    menu
    run
  end
end

def run
  puts "Что вы хотите сделать?"
  action = gets.chomp
  case action
    when "1"
      new_station
    when "2"
      new_train
    when "3"
      add_carriage
    when "4"
      delete_carriage
    when "5"
      add_train_to_station
    when "6"
      all_stations
    when "7"
      list_trains_to_station
    when "8"
      exit
  end
  # puts action
end

def new_station
  puts "Укажите имя станции:"
  name = gets.chomp
  station = Station.new(name)
  @stations.push(station)
  puts "Создана станция #{name}"
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
end

def all_trains
   @trains.each_with_index { |train, n| puts "#{n} #{train.num}"}
end

def add_carriage
  puts "Укажите номер поезда"
  all_trains
  num = gets.chomp.to_i
  puts @trains[num].type

  if trains[num].type == :cargo
    puts "Этот поезд - грузовой, к нему будет добавлен грузовой вагон"
    carriage = CargoCarriage.new
      @trains[num].carriages.push(carriage)
  elsif trains[num].type == :passenger
    puts "Этот поезд - пассажирский, к нему будет добавлен пассажирский вагон"
    carriage = PassengerCarriage.new
      @trains[num].carriages.push(carriage)  
  else
    puts "Такого поезда нет"
  end
end

def delete_carriage
  puts "Укажите номер поезда"
  all_trains  
  num = gets.chomp
  @trains.carriages.delete(num)
end

def add_train_to_station
  puts "Выберите номер станции к которой хотите добавить поезд"
  puts all_stations
  num_st = gets.chomp.to_i
  # puts stations[num_st]
  puts "Укажите номер поезда"
  all_trains
  num_tr = gets.chomp.to_i
  # puts trains[num].num

# При попытке записать в станцию новый поезд получаю 
# undefined method `push' for #<Station:
# но ведь это массив, почему не могу добавить?

  @stations[num_st].push(@trains[num_tr].num)
  puts "На станцию #{num_st} Прибыл поезд #{trains[num_tr].num}"
end

def all_stations
  @stations.each_with_index{ |station, n| puts " #{n} #{station.name}" }
end

def list_trains_to_station
  puts "Выберите номер станции"
  puts all_stations
  num_st = gets.chomp.to_i
  puts all_stations[num_st].name
  puts "На станции #{all_stations[num_st].name} находятся поезда: "
  @all_stations[num_st].trains.each_pair { |type, num| puts "#{type} #{num}" }
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

controller = Controller.new
controller.start
