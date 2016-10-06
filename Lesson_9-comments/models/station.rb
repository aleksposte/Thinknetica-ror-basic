
class Station
  
  include InstanceCounter
  include Accessors
  include Validation

  NAME_STATION = /^[a-zа-я\d]/i

  @@all = []

  attr_accessor :name,
                :trains,
                :cargo_train,
                :passenger_train

  validate :name, :presence
  validate :name, :format, NAME_STATION
  validate :attribute_class, :type, "Station"

  def initialize(name)
    @name = name
    @attribute_class = self.class.to_s
    validate!
    @trains = {
                cargo: [],
                passenger: []
    }
  end

  def add_train(train)
    @trains[train.type].push(train)
    puts "На станцию #{name} Прибыл поезд #{train.num}"
    puts "Trains class train: #{@trains}"
  end

  def delete_train(train)
    @trains[train.type].delete(train)
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

  def train_in(block)
    @trains.values.flatten.each do |train|
      # @trains.values.flatten.each(&block)
      block.call(train)
    end
  end

  private

  # validate_station
  # def validate!
  #   fail puts 'Наименование не соответствует формату' if @name !~ NAME_STATION
  #   fail puts 'Длина наименования станции слишком велика' if @name.length > 5
  # end
end
