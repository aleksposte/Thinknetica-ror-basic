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

  attr_accessor :name, 
                :trains,
                :cargo_nums,
                :passenger_nums

  def initialize(name)
    @name = name
    @trains = {}
    @cargo_nums = []
    @passenger_nums = []
  end


# При такой конструкции хэша много дублированных данных:

# {
#   train_1 => :type_1,
#   train_2 => :type_1,
#   train_3 => :type_1,
#   train_4 => :type_2
# }
# Будет лучше изменить тактику и ключом сделать тип поезда, 
# а значением - массив поездов. Кроме того, для нас привычней 
# когда мы отталкиваемся от множества, то есть сначала говорим 
# что вот у нас такой-то тип, а потом уже перечисляем объекты этого типа.

# Переделал, проверяю к какому классу относиться, 
# и записываю в какой-либо из массивов.Надеюсь правильно сделал и данный вариант приемлим.

  def add_train(train)
    if train.type == 'cargo'
      self.cargo_nums.push(train.num)
    elsif train.type == 'passenger'
      self.passenger_nums.push(train.num)
    end
  end

  def delete_train(train)
    trains.delete(train.num)
      puts "Со станции #{name} отбыл поезд: #{train.num}"
  end

  def print_all_trains
    puts "На станции #{name} находиться #{cargo_nums.size} грузовых и #{passenger_nums.size} пассажирских"
    puts "Грузовые:"
    puts self.cargo_nums.each { |train| " #{train} \n" } 
    puts "Пассажирские:"
    puts self.passenger_nums.each { |train| " #{train} \n" } 
  end

end
