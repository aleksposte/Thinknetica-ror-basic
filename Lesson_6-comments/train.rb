require_relative 'manufacturer.rb'
require_relative 'instance_counter.rb'
# 
class Train

include Manufacturer
include InstanceCounter

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

# Релизовать проверку на формат номера поезда. Допустимый формат: 
# три буквы или цифры в любом порядке, 
# необязательный дефис 
# (может быть, а может нет) и еще 2 буквы или цифры после дефиса.

  def initialize(num)
    @num = num
    @type = type
    @carriage = 0
    @carriages = []
    @speed = 0
    @route = []
    validate_new_train!
    self.class.trains[num] = self
    register_instance
  end

# - Программа запрашивает у пользователя данные для создания поезда (номер и другие необходимые атрибуты)
# - Если атрибуты валидные, то выводим информацию о том, что создан такой-то поезд
# - Если введенные данные невалидные, то программа должна вывести сообщение о возникших ошибках и заново запросить данные у пользователя. 
#  Реализовать это через механизм обработки исключений

  def validate_new_train!
    # raise puts "Номер поезда не может быть пустым" if num.nil?
    raise puts "Номер поезда не соответствует формату(Допустимый формат: xxx-xx или xxxxx)" if num !~ NUM_TRAIN
    true
  rescue TypeError
    puts "Попробуйте еще раз"
  end

  def valid?
    validate_new_train!
    true
  rescue 
    false
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
    @current_station = @route.list_stations.first
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{@route.list_stations.first} - #{@route.list_stations.last}"
  end

  def print_next_station
     if @current_station == @route.list_stations.last
      puts "Это последняя станция"
    else
      next_station
      puts "Следущая станция #{next_station}"
    end
  end

  def print_prev_station
    if @current_station == @route.list_stations.first
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
    puts "Это конечная станция, можно ехать обратно" if @current_station == @route.list_stations.last
  end

  def go_prev_station
    if @current_station == @route.list_stations.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      @current_station != @route.list_stations.last
      puts "Это еще не конечная станция, едем вперед" 
    else 
      @current_station == prev_station
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

def self.find(num)
  @trains[num]
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