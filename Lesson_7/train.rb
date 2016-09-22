class Train

include Manufacturer
include InstanceCounter
include Validate

NUM_TRAIN = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i

attr_accessor:num,
            :type,
            :carriage,
            :carriages,
            :speed,
            :current_station,
            :route

class << self; attr_accessor :trains end
  @trains = {}

  def initialize(num)
    @num = num
    @type = type
    @carriage = 0
    @carriages = []
    @speed = 0
    @route = []
    validate!
    self.class.trains[num] = self
    register_instance
  end


  def accelerate(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def print_speed
    puts speed
  end

# У класса Train:
 # написать метод, который принимает блок и проходит по всем вагонам поезда 
 # (вагоны должны быть во внутреннем массиве), 
 # передавая каждый объект вагона в блок.
 
  def carriages_in(&block)
    self.carriages.each do |carriage| 
      block.call(carriage)
    end
  end

# Добавление вагонов

  def add_carriage(carriage)
    puts "Cначала остановите поезд!" if @speed != 0
    if carriage.type != @type
      puts "Тип поезда и вагона не совпадают"
    else
      @carriages.push(carriage)
      puts "К поезду #{num} был добавлен вагон, в составе #{self.carriages.size} вагонов"
    end
  end

  def delete_carriage(carriage)
    puts "Cначала остановите поезд!" if @speed != 0
    if carriage.type != @type
      puts "Тип поезда и вагона не совпадают"
    else
      @carriages.delete(carriage)
      puts "Удален вагон, в составе осталось #{self.carriages.size} вагона"
    end
  end

# Маршрут следования

  def accept_route(route)
    @route = route
    @current_station = stations.first
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{stations.first} - #{stations_last}"
  end

  def print_next_station
     if @current_station == stations_last
      puts "Это последняя станция"
    else
      next_station
      puts "Следущая станция #{next_station}"
    end
  end

  def print_prev_station
    if @current_station == stations.first
      puts "Это первая станция"
    else
      prev_station
      puts "Предыдущая станция #{prev_station}"
    end
  end

# Премещения поезда между станциями

  def go_next_station
    @current_station = next_station
    puts "Поезд приехал на станцию #{@current_station}"
    puts "Это конечная станция, можно ехать обратно" if @current_station == stations_last
  end

  def go_prev_station
    if @current_station == stations.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      @current_station != stations_last
      puts "Это еще не конечная станция, едем вперед" 
    else 
      @current_station == prev_station
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

def self.find(num)
  @trains[num]
end

# Для упрощения записи:

def stations.first
  stations.first = @route.list_stations.first
end

def stations_last
  stations_last = @route.list_stations.last
end



protected

  # validate_train
  def validate!
    # raise puts "Номер поезда не может быть пустым" if num.nil?
    raise puts "Номер поезда не соответствует формату(Допустимый формат: xxx-xx или xxxxx)" if num !~ NUM_TRAIN
    true
  end

private

  def next_station
    next_station = @route.list_stations[@route.list_stations.index(@current_station) + 1]
  end

  def prev_station
    prev_station = @route.list_stations[@route.list_stations.index(@current_station) - 1]
  end
  
end

require_relative 'cargo_train.rb'
require_relative 'passenger_train.rb'
