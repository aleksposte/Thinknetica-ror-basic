

class Station

  attr_accessor :name, 
                :trains,
                :cargo_train,
                # :type,
                :passenger_train

  def initialize(name)
    @name = name
    # @type = type
    @trains = {}
    @cargo_train = []
    @passenger_train = []
  end

  def add_train(train)
    if train.type == 'cargo'
      self.cargo_train.push(train.num)
    elsif train.type == 'passenger'
      self.passenger_train.push(train.num)
    end
  end

  def delete_train(train)
    trains.delete(train.num)
      puts "Со станции #{name} отбыл поезд: #{train.num}"
  end

  def print_all_trains
    puts "На станции #{name} находиться #{cargo_train.size} грузовых и #{passenger_train.size} пассажирских"
    puts "Грузовые:"
    puts self.cargo_train.each { |train| " #{train} \n" } 
    puts "Пассажирские:"
    puts self.passenger_train.each { |train| " #{train} \n" } 
  end

end
