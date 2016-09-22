
class Station

include InstanceCounter
include Validate


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

# У класса Station:
# написать метод, который принимает блок и проходит по всем поездам на станции, 
# передавая каждый поезд в блок.

  def trains_in(&block)
    # puts block
    self.trains.each_value do |train| 
      block.call(train)
    end
  end

  private

  # validate_station
  def validate!
    raise puts "Наименование станции не соответствует формату" if @name !~ NAME_STATION
    raise puts "Длина наименования станции слишком велика" if @name.length > 5
  end

end
