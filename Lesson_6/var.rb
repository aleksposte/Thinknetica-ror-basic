

# class Train

# NUM_TRAIN = /^[а-яa-z\d]{3}-?[а-яa-z\d]{2}$/i

# attr_accessor:num,
#             :type,
#             :carriage,
#             :carriages,
#             :speed,
#             :current_station,
#             :route

# class << self; attr_accessor :trains end
#   @trains = {}

# # Релизовать проверку на формат номера поезда. Допустимый формат: 
# # три буквы или цифры в любом порядке, 
# # необязательный дефис 
# # (может быть, а может нет) и еще 2 буквы или цифры после дефиса.

#   def initialize(num)
#     @num = num
#     @type = type
#     @carriage = 0
#     @carriages = []
#     @speed = 0
#     @route = []
#     validate_new_train!
#     self.class.trains[num] = self
#     # register_instance
#   end

# # - Программа запрашивает у пользователя данные для создания поезда (номер и другие необходимые атрибуты)
# # - Если атрибуты валидные, то выводим информацию о том, что создан такой-то поезд
# # - Если введенные данные невалидные, то программа должна вывести сообщение о возникших ошибках и заново запросить данные у пользователя. 
# #  Реализовать это через механизм обработки исключений

#   def validate_new_train!
#     # raise puts "Номер поезда не может быть пустым" if num.nil?
#     raise puts "Номер поезда не соответствует формату(Допустимый формат: xxx-xx или xxxxx)" if num !~ NUM_TRAIN
#     true
#   rescue TypeError
#     puts "Попробуйте еще раз"
#   end

#   def valid?
#     validate_new_train!
#     true
#   rescue 
#     false
#   end
# end

# require_relative 'cargo_train.rb'
# require_relative 'passenger_train.rb'

# class Controller

# TRAIN_TYPES = {
#                 :cargo     => CargoTrain,
#                 :passenger => PassengerTrain
# }

# # CARRIAGE_TYPES = {
# #                   :cargo     => CargoCarriage,
# #                   :passenger => PassengerCarriage
# # }

# # TRAIN_TYPE_VALIDE = /^(cargo\z|passenger\z)/

# attr_accessor :stations,
#               :trains

#   def initialize
#     @stations = []
#     @trains = []
#   end

#   def start
#     loop do
#       # menu
#       run
#     end
#   end

#   def run
#     puts "Что вы хотите сделать?"
#     action = gets.chomp
#     case action
#       when "1"
#         new_station
#       when "2"
#         new_train
#       when "3"
#         add_carriage
#       when "4"
#         delete_carriage
#       when "5"
#         add_train_to_station
#       when "6"
#         all_stations
#       when "7"
#         list_trains_to_station
#       when "8"
#         exit
#     end
#   end

#   def new_station
#     puts "Укажите Наименование станции(Используются буквы или цифры, не более 5 знаков):"
#     name = gets.chomp


#     station = Station.new(name) 
#       @stations.push(station)
#       puts "Создана станция #{name}"
#   end

#  def new_train
#     puts "Укажите тип поезда (cargo или passenger)"
#     type = gets.chomp.to_sym

#     puts "Укажите номер поезда"
#     num = gets.chomp

#     train_class = TRAIN_TYPES[type]
#     if train_class
#       @trains.push(train_class.new(num)) 
#       puts "Создан поезд типа #{type} номер #{num}"
#     else
#       puts "Такого типа поезда нет"
#     end
#   end


# end

# controller = Controller.new
# controller.start

class Station

NAME_STATION = /^[a-zа-я\d]/i

@@all = []

attr_accessor :name, 
              :trains,
              :cargo_train,
              :passenger_train

  def initialize(name)
    @@all.push(self)
    @name = name
    validate!
    @trains = {
                :cargo     => [],
                :passenger => []
    }
  end

  
  def valid?
    validate!
  rescue 
    false
  end

  def add_train(train)
    @trains[train.type].push(train.num)
    puts "На станцию #{name} Прибыл поезд #{train.num}"
  end

  def delete_train(train)
    @trains[train.type].delete(train.num)
    puts "Со станции #{name} отбыл поезд #{train.num}"
  end

  def print_all_trains
    puts "На станции #{name} находятся грузовые поезда:"
      @trains[:cargo].each do |n|
        puts "#{n}"
      end
    puts "На станции #{name} находятся пассажирские поезда:"
      @trains[:passenger].each do |n|
        puts "#{n}"
      end
  end 

  def self.all
    @@all
  end

  private

  # validate!

  def validate!
    # raise "Наименование станции не может быть пустым" if name.nil?
    raise puts "Наименование станции не соответствует формату" if @name !~ NAME_STATION
    raise puts "Длина наименования станции слишком велика" if @name.length > 5
    # rescue StandardError
    #   puts "попробуйте еще раз"
  end

end

st = Station.new('../r')
puts st.name

