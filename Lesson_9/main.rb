
# Modules
require_relative 'modules/manufacturer.rb'
require_relative 'modules/instance_counter.rb'
require_relative 'modules/validation.rb'
require_relative 'modules/accessors.rb'

# require_relative 'menu.rb'
require_relative 'models/station.rb'
require_relative 'models/route.rb'

require_relative 'models/train.rb'
# перенес в train
# require_relative 'cargo_train.rb'
# require_relative 'passenger_train.rb'

require_relative 'models/carriage.rb'
# Перенес в carriage
# require_relative 'models/cargo_carriage.rb'
# require_relative 'models/passenger_carriage.rb'

class Controller
  TRAIN_TYPES = {
    cargo: CargoTrain,
    passenger: PassengerTrain
  }

  CARRIAGE_TYPES = {
    cargo: CargoCarriage,
    passenger: PassengerCarriage
  }

  attr_accessor :stations,
                :trains

  def initialize
    @stations = []
    @trains = []
  end

  def start
    loop do
      puts File.read('menu.txt')
      # menu
      run
    end
  end

  def run
    puts 'Что вы хотите сделать?'
    action = gets.chomp
    case action
    when '1'
      new_station
    when '2'
      new_train
    when '3'
      add_carriage
    when '4'
      delete_carriage
    when '5'
      add_train_to_station
    when '6'
      all_stations
    when '7'
      list_trains_to_station
    when '8'
      list_carriages_to_train
    when '9'
      load_carriage
    when '10'
      exit
    end
  end

  def new_station
    puts 'Укажите Наименование станции (Не более 5 знаков):'
    name = gets.chomp
    create_station!(name)

  # rescue StandardError
  #   puts 'попробуйте еще раз'
  #   retry
  end

  def new_train
    puts 'Укажите тип поезда (cargo или passenger)'
    type = gets.chomp.to_sym
    puts 'Укажите номер поезда'
    num = gets.chomp
    create_train!(type, num)

  rescue StandardError
    puts 'попробуйте еще раз'
    retry
  end

  def add_carriage
    train = selected_train
    if train.type == :cargo
      puts 'Укажите объем вагона'
      capacity = gets.chomp.to_i
      puts capacity
    else
      puts 'Укажите количество мест в вагоне'
      capacity = gets.chomp.to_i
    end

    carriage_type = CARRIAGE_TYPES[train.type]
    if carriage_type
      train.carriages.push(carriage_type.new(capacity))
      puts "Этот поезд типа #{train.type}, к нему будет добавлен вагон типа #{carriage_type}"
      if train.type == :cargo
        puts "объемом: #{capacity}"
      else
        puts "с количеством мест: #{capacity}"
      end
    else
      puts 'Такого поезда нет'
    end
  end

  def delete_carriage
    puts 'Укажите номер поезда'
    all_trains
    num = gets.chomp
    @trains.carriages.delete(num)
  end

  def add_train_to_station
    station = selected_station
    train = selected_train
    station.add_train(train)
    puts "На станцию #{station.name} Прибыл поезд #{train}"
  end

  def list_trains_to_station
    station = selected_station
    puts " На станции #{station.name} находятся поезда: "
    trains = lambda do |train|
      puts train
      puts "№: #{train.num}, тип: #{train.type}, вагонов: #{train.carriages.length} "
    end
    station.train_in(trains)
    end

  def list_carriages_to_train
    train = selected_train
    n = 1
    train.carriages_in do |carriage|
      if train.type == :cargo
        puts " №#{n} Тип вагона: cargo"
        puts "Занято объема: #{carriage.volume}"
        puts "Осталось свободного объема: #{carriage.free_capacity}"
      else
        puts " №#{n} Тип вагона: passenger"
        puts "Занято мест: #{carriage.seats}"
        puts "Осталось мест: #{carriage.free_capacity}"
      end
      n += 1
    end
  end

  def load_carriage
    train = selected_train
    puts 'Укажите вагон'
    n = 1
    train.carriages_in do |carriage|
      if train.type == :cargo
        puts " №#{n} Тип вагона:cargo, занято: #{carriage.volume}"
        puts "Осталось свободного объема: #{carriage.free_capacity}"
      else
        puts " №#{n} Тип:passenger, занято: #{carriage.seats}"
        puts "Осталось мест: #{carriage.free_capacity}"
      end
      n += 1
    end
    num_carriage = gets.chomp.to_i
    selected_carriage = train.carriages[num_carriage - 1]

    puts "Вагон: #{selected_carriage}"
    if train.type == :cargo
      puts 'Укажите объем'
      value = gets.chomp.to_i
      selected_carriage.load(value)
    else
      puts 'Укажите количестко мест'
      value = gets.chomp.to_i
      selected_carriage.load(value)
    end
  end

  # Helper methods

  def create_station!(name)
    station = Station.new(name)
    @stations.push(station)
    puts "Создана станция #{name}"
  end

  def create_train!(type, num)
    train_class = TRAIN_TYPES[type]
    if train_class
      @trains.push(train_class.new(num))
      puts "Создан поезд типа #{type} номер #{num}"
    else
      puts 'Такого типа поезда нет'
    end
  end

  def selected_train
    fail 'Список поездов пуст, создайте поезд!' if @trains.nil?
    puts 'Укажите номер поезда'
    all_trains
    num = gets.chomp.to_i
    selected_train = all_trains[num]
    selected_train
  end

  def all_trains
    @trains.each_with_index { |train, n| puts "#{n} #{train.num}" }
  end

  def selected_station
    fail 'Список станций пуст, создайте станцию!' if @stations.nil?
    puts 'Выберите номер станции'
    puts all_stations
    num = gets.chomp.to_i
    selected_station = @stations[num]
    selected_station
  end

  def all_stations
    @stations.each_with_index { |station, n| puts " #{n} #{station.name}" }
  end

end

controller = Controller.new
controller.start
