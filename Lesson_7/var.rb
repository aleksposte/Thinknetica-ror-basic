

# Добавить атрибут общего кол-ва мест (задается при создании вагона)
# Добавить метод, который "занимает места" в вагоне (по одному за раз)
# Добавить метод, который возвращает кол-во занятых мест в вагоне


# class Carriage
  
#   attr_accessor :type

#   # @seats
    
#   def initialize(capacity)
#    @capacity = capacity
#    @load = 0
#   end

# # Добавить метод, который "занимает места" в вагоне (по одному за раз)
#   def load
#     if @load < @capacity 
#       @load += 1
#       puts "Вы заняли место, свободных осталось #{@capacity - @load}"
#     else
#       puts "Мест больше нет"
#     end
#   end

# # Добавить метод, который возвращает кол-во занятых мест в вагоне
#   def occupied
#     @load
#   end

# # Добавить метод, возвращающий кол-во свободных мест в вагоне.
#   def vacancies
#     @capacity - @load
#   end

# end


# class CargoCarriage
  
#   def initialize(capacity)
#    @type = :cargo
#    @capacity = capacity
#    @load = 0
#   end

# # Добавить метод, которые "занимает объем" в вагоне (объем указывается в качестве параметра метода)
#   def load(value)
#     if value < @capacity 
#       @load += value
#       puts "Вы заняли объем #{value}, свободно осталось #{@capacity - @load}"
#     else
#       puts "Места больше нет"
#     end
#   end

# # Добавить метод, который возвращает занятый объем
#   def occupied
#     @load
#   end

# # Добавить метод, который возвращает оставшийся (доступный) объем
#   def vacancies
#     @capacity - @load
#   end

# end

# У класса Station:
# написать метод, который принимает блок и проходит по всем поездам на станции, 
# передавая каждый поезд в блок.






# c = CargoCarriage.new(5)
# c.load(2)
# puts c.occupied
# puts c.vacancies

# c.load(4)
# puts c.occupied
# puts c.vacancies


# @trains = {
#           :cargo => [1, 2, 3],
#           :passenger => [4, 5, 6]

# }
# puts @trains

# # tr = @trains.each_value { |t| }
# tr = @trains.to_a


# puts tr

h = { a: [1, 3], b: 3 }

h.each do |key, value|
  puts value
end







