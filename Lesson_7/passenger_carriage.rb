# Вагоны

# Добавить атрибут общего кол-ва мест (задается при создании вагона)
# Добавить метод, который "занимает места" в вагоне (по одному за раз)
# Добавить метод, который возвращает кол-во занятых мест в вагоне

class PassengerCarriage < Carriage

  def initialize(capacity)
   @type = :passenger
   @capacity = capacity
   @load = 0
  end

# Добавить метод, который "занимает места" в вагоне (по одному за раз)
  def load
    if @load < @capacity 
      @load += 1
      puts "Вы заняли место, свободных осталось #{@capacity - @load}"
    else
      puts "Мест больше нет"
    end
  end

# Добавить метод, который возвращает кол-во занятых мест в вагоне
  def occupied
    @load
  end

# Добавить метод, возвращающий кол-во свободных мест в вагоне.
  def vacancies
    @capacity - @load
  end

end
