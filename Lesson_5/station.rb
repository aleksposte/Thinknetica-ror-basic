
# Создать модуль, который позволит указывать название компании-производителя и 
# получать его. Подключить модуль к классам Вагон и Поезд

# В классе Station (жд станция) создать метод класса all, 
# который возвращает все станции (объекты), созданные на данный момент

# Добавить к поезду атрибут Номер (произвольная строка), 
# если его еще нет, который указыватеся при его создании

# В классе Train создать метод класса find, 
# который принимает номер поезда (указанный при его создании) и 
# возвращает объект поезда по номеру или nil, если поезд с таким номером не найден.

class Station

@@all = []

attr_accessor :name, 
              :trains,
              :cargo_train,
              :passenger_train
# Нужно возвращать объекты вместо количества станций.
# Добавил добавление в @@all при инициализации
  def initialize(name)
    @@all.push(self)
    @name = name
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

end
