
class Train

 attr_accessor:num,
              :type,
              :carriage,
              :carriages,
              :speed,
              :current_station,
              :route
  
  def initialize(num)
    @num = num
    @type = type
    @carriage = 0
    @carriages = []
    @speed = 0
    @route = []
  end

  def accelerate(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def print_speed
    puts speed
  end

# Добавление вагонов

  def add_carriage(carriage)
    puts "Cначала остановите поезд!" if @speed != 0
    if carriage.type != self.type
      puts "Тип поезда и вагона не совпадают"
    else
      @carriages.push(carriage)
      puts "К поезду #{num} был добавлен вагон, в составе #{self.carriages.size} вагонов"
    end
  end

  def delete_carriage(carriage)
    puts "Cначала остановите поезд!" if @speed != 0
    if carriage.type != self.type
      puts "Тип поезда и вагона не совпадают"
    else
      @carriages.delete(carriage)
      puts "Удален вагон, в составе осталось #{self.carriages.size} вагона"
    end
  end

# Test
# tr = CargoTrain.new(55)
# tr3 = PassengerTrain.new(88)

# c1 = CargoCarriage.new
# c2 = CargoCarriage.new
# c3 = PassengerCarriage.new

# Старый вариант
# def add_carriage(carriage)
#     if @speed != 0
#       puts "Cначала остановите поезд!"
#     elsif  carriage.type != 'cargo'
#       puts "Это вагон не является Грузовым"
#     else
#       self.carriages.push(carriage)
#       puts "У поезда #{num} Грузовых вагонов: #{self.carriages.size}"
#     end
#   end

#   def delete_carriage(carriage)
#     if @speed != 0
#       puts "Cначала остановите поезд!"
#     else
#       self.carriages.delete(carriage)
#       puts "Удален вагон, в составе осталось #{self.carriages.size} вагонов"
#     end
#   end

# Маршрут следования
# Переделать с  использование объекта route 

  def accept_route(route)
    @route = route
    @current_station = @route.list_stations.first
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{@route.list_stations.first} - #{@route.list_stations.last}"
  end

  def print_next_station
     if @current_station == @route.list_stations.last
      puts "Это последняя станция"
    else
      next_station = @route.list_stations[@route.list_stations.index(@current_station) + 1]
      puts "Следущая станция #{next_station}"
    end
  end

  def print_prev_station
    if @current_station == @route.list_stations.first
      puts "Это первая станция"
    else
      prev_station = @route.list_stations[@route.list_stations.index(@current_station) - 1]
      puts "Предыдущая станция #{prev_station}"
    end
  end

# Премещения поезда между станциями

  def go_next_station
    @current_station = @route.list_stations[@route.list_stations.index(@current_station) + 1]
    puts "Поезд приехал на станцию #{@current_station}"
    puts "Это конечная станция, можно ехать обратно" if @current_station == @route.list_stations.last
  end

  def go_prev_station
    if @current_station == @route.list_stations.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      @current_station != @route.list_stations.last
      puts "Это еще не конечная станция, едем вперед" 
    else 
      @current_station == @route.list_stations[@route.list_stations.index(@current_station) - 1]
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

end

