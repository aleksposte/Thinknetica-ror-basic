
class Station
# Я бы предпочёл одну структуру данных - то есть хэш @trains 
# потому что если вводить новый массив для каждого типа поезда, 
# то при добавлении нового типа поезда придётся добавлять и 
# переменную с этим массивом - получается сильная связанность. 
# В случае с одним хэшем @trains этого можно избежать, 
# если в качестве ключа использовать тип поезда.

  attr_accessor :name, 
                :trains,
                :cargo_train,
                # :type,
                :passenger_train

  def initialize(name)
    @name = name
    # @type = type
    @trains = {
                :cargo     => [],
                :passenger => []
    }
    # @cargo_train = []
    # @passenger_train = []
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

# Test
# require_relative 'train.rb'
# require_relative 'cargo_train.rb'
# require_relative 'passenger_train.rb'

# st= Station.new('FFF')

# tr = CargoTrain.new(55)
# tr1 = CargoTrain.new(66)

# tr3 = PassengerTrain.new(88)
# tr4 = PassengerTrain.new(100)



# Старый вариант
  # def add_train(train)
  #   if train.type == 'cargo'
  #     self.cargo_train.push(train.num)
  #   elsif train.type == 'passenger'
  #     self.passenger_train.push(train.num)
  #   end
  # end

  # def delete_train(train)
  #   trains.delete(train.num)
  #     puts "Со станции #{name} отбыл поезд: #{train.num}"
  # end

# Старый вариант, переделать, тк один хеш
  # def print_all_trains
  #   puts "На станции #{name} находиться #{cargo_train.size} грузовых и #{passenger_train.size} пассажирских"
  #   puts "Грузовые:"
  #   puts self.cargo_train.each { |train| " #{train} \n" } 
  #   puts "Пассажирские:"
  #   puts self.passenger_train.each { |train| " #{train} \n" } 
  # end

end
