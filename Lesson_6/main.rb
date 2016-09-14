
require_relative 'menu.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
# require_relative 'cargo_train.rb' # перенес в Train
# require_relative 'passenger_train.rb'
require_relative 'carriage.rb'
require_relative 'cargo_carriage.rb'
require_relative 'passenger_carriage.rb'
# require_relative 'manufacturer.rb'
# require_relative 'instance_counter.rb'


class Controller

TRAIN_TYPES = {
                :cargo     => CargoTrain,
                :passenger => PassengerTrain
}

CARRIAGE_TYPES = {
                  :cargo     => CargoCarriage,
                  :passenger => PassengerCarriage
}

TRAIN_TYPE_VALIDE = /^(cargo\z|passenger\z)/

attr_accessor :stations,
              :trains

  def initialize
    @stations = []
    @trains = []
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
  end

  def new_station
    puts "Укажите Наименование станции(Используются буквы или цифры, не более 5 знаков):"
    name = gets.chomp

    
    station = Station.new(name) 
      @stations.push(station)
      puts "Создана станция #{name}"
  end

 def new_train
    puts "Укажите тип поезда (cargo или passenger)"
    type = gets.chomp.to_sym

    # raise "Тип поезда не соответствует формату" if type !~ TRAIN_TYPE_VALIDE
    # rescue RuntimeError
    #   puts "Попробуйте еще раз"
    # # retry  
    
    puts "Укажите номер поезда"
    num = gets.chomp

    train_class = TRAIN_TYPES[type]
    if train_class && train_class.new(num).valid?
      @trains.push(train_class.new(num))
      puts "Создан поезд типа #{type} номер #{num}"
    # else
    #   puts "Такого типа поезда нет"
    end
  end

  def all_trains
     @trains.each_with_index { |train, n| puts "#{n} #{train.num}"}
  end

  def add_carriage
    puts "Укажите номер поезда"
    all_trains
    num = gets.chomp.to_i

    carriage_type = CARRIAGE_TYPES[@trains[num].type]
    if carriage_type
      @trains[num].carriages.push(carriage_type.new)
      puts "Этот поезд типа #{@trains[num].type}, к нему будет добавлен вагон типа #{carriage_type}"
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

    puts "Укажите номер поезда"
    all_trains
    num_tr = gets.chomp.to_i
    @stations[num_st].add_train(trains[num_tr])

    puts "На станцию #{num_st} Прибыл поезд #{trains[num_tr]}"
  end

  def all_stations
    @stations.each_with_index{ |station, n| puts " #{n} #{station.name}" }
  end

  def list_trains_to_station
    puts "Выберите номер станции"
    puts all_stations
    num_st = gets.chomp.to_i
    puts "На станции #{all_stations[num_st].name} находятся поезда: "
    @stations[num_st].trains.each_with_index{ |num, n| puts "#{n} #{num}" }
  end

end

controller = Controller.new
controller.start
