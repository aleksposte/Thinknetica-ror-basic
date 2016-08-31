
class Train

 attr_accessor:num,
              :type,
              :carriage,
              :carriages_all,
              :speed,
              :current_station,
              :route
  
  def initialize(num)      
  # def initialize(num, type)
    @num = num
    @type = type
    @carriage = 0
    @carriages_all = []
    @speed = 0
    @route = []
  end

# def accelerate(speed)
#     @speed += speed
#   end

#   def stop
#     @speed = 0
#   end

#   def print_speed
#     puts speed
#   end

# Маршрут следования
 # Переделать с  использование объекта route 
  def accept_route(route)
    @route = route.route
    self.current_station = self.route.first
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{self.route.first} - #{self.route.last}"
  end

  def print_next_station
     if self.current_station == self.route.last
      puts "Это последняя станция"
    else
      next_station = self.route[self.route.index(self.current_station) + 1]
      puts "Следущая станция #{next_station}"
    end
  end

  def print_prev_station
    if self.current_station == self.route.first
      puts "Это первая станция"
    else
      prev_station = self.route[self.route.index(self.current_station) - 1]
      puts "Предыдущая станция #{prev_station}"
    end
  end

# Премещения поезда между станциями

  def go_next_station
    self.current_station = self.route[self.route.index(self.current_station) + 1]
    puts "Поезд приехал на станцию #{self.current_station}"
    puts "Это конечная станция, можно ехать обратно" if self.current_station == self.route.last
  end

  def go_prev_station
    if self.current_station == self.route.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      self.current_station != self.route.last
      puts "Это еще не конечная станция, едем вперед" 
    else 
      self.current_station == self.route[self.route.index(self.current_station) - 1]
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

  protected
  # переместил сюда, тк скорость используется только класаами потомками,
  # но при попытке вызвать из объекта CargoTrain получаю ошибку 
  # NoMethodError: protected method `print_speed' called for #<CargoTrain:0x007f94ba97b098>
  # не могу понять, где ошибся

  def accelerate(speed)
      @speed += speed
  end

  def stop
    @speed = 0
  end

  def print_speed
    puts speed
  end

end

