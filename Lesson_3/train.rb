# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) 
# и количество вагонов, эти данные указываются при создании 
# экземпляра класса
# Может набирать скорость
# Может показывать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)

# Может показывать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, 
#   метод просто увеличивает или уменьшает количество вагонов). 
# Прицепка/отцепка вагонов может осуществляться 
# только если поезд не движется.

# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, 
# на основе маршрута
#  passenger

class Train

  attr_accessor :num,
                :type,
                :carriage,
                :speed,
                :current_station,
                :route
                
  def initialize(num, type)
    @num = num
    @type = type
    @carriage = 0
    @speed = 0
    @route = []
  end

# Скорость поезда

# Первый момент - мы можем сразу обращаться к инстанс переменной @speed.
# Второй момент, не думаю что поезд мгновенно может изменить значение скорости, 
# скорее увеличить её.

# Теперь поскольку мы увеличиваем скорость то метод со знаком = на конце не вполне годится. 
# Лучше назвать increase_speed, accelerate, что-то в этом духе.
#   def go=(speed)
def accelerate(speed)
    @speed += speed
  end

# Опять же, через self мы именно метод вызываем и это будет дольше работать, 
# чем сразу обратиться к инстанс переменной. Принцип инкапсуляции не нарушается, 
# потому что 
# мы обращаемся к данным объекта уже находясь в контексте этого объекта.
  def stop
    # self.speed = 0
    @speed = 0
  end
# Лучше назвать это print_speed.
  def print_speed
    puts speed
  end

# Вагоны
# То же самое, инстанс переменная @carriage здесь доступна.
# Инстанс переменная @speed тоже доступна )
  def add_carriage
    if @speed != 0
      puts "Cначала остановите поезд!"
    else 
      @carriage += 1
    end
  end

  def delete_carriage
    if @speed != 0
      puts "Cначала остановите поезд!"
    else 
      @carriage -= 1
    end
  end

  def print_all_carriage
    puts carriage
  end

# Маршрут следования

# Может принимать маршрут следования (объект класса Route)
# Может перемещаться между станциями, указанными в маршруте.
# Показывать предыдущую станцию, текущую, следующую, 
# на основе маршрута
# Маршрут, передача станций поезду

# Мы должны передавать поезду именно маршрут, а не список станций.
# Немного не ясное название метода. Лучше take_route или accept_route, что-то подобное.
  
  def accept_route(route)
    @route = route.route
    self.current_station = self.route.first
    puts "Поезд находится на станции #{current_station} и поедет по марщруту #{self.route.first} - #{self.route.last}"
  end

# Если мы выводим предыдущую станцию, лучше назвать метод print_prev_station.

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

# Подход в принципе нормальный, хотя вряд ли в реальности поезд будет двигаться назад. 
# Скорее он доберётся до конечной станции и вот тогда да, будет двигаться в обратном направлении.

# После else обычно пишут на новой строке.

  def go_prev_station
    if self.current_station == self.route.first
      puts "Это первая станция, можно ехать только вперед"
    elsif 
      self.current_station != self.route.last
      puts "Это еще не конечная станция, едем вперед" 
    else #Здесь наверное равенство должно быть?
      self.current_station == self.route[self.route.index(self.current_station) - 1]
      puts "Поезд приехал на станцию #{self.current_station}"
    end
  end

end
