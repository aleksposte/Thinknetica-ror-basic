# Требуется написать следующие классы:

# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может показывать список всех поездов на станции, 
# находящиеся в текущий момент
# Может показывать список поездов на станции по типу 
# (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, 
# поезд удаляется из списка поездов, находящихся на станции).

class Station

  attr_accessor :station_name, 
                :trains,
                :train_name,
                :train_type

  def initialize(station_name)
    @trains = {}
    @station_name = station_name
    # puts station_name
  end

  def accept_train(train_name, train_type)
    self.trains[train_name] = train_type
      puts "На станцию #{self.station_name} прибыл поезд: #{train_name}"
  end

  def depart_train(train_name)
    trains.delete(train_name)
      puts "Со станции #{station_name} отбыл поезд: #{train_name}"
    # puts "На станции #{station_name} остались поезда:"
    #   trains.each_pair do |name, type|
    #     puts "#{name}, тип поезда: #{type} \n"
    #   end
  end

  def all_trains
    puts "На станции #{station_name} находятся поезда:"
      trains.each_pair do |name, type|
        puts "#{name}, тип поезда: #{type} \n"
      end
  end

end
