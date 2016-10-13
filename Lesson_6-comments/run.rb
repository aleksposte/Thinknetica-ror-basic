# Разбить программу на отдельные классы (каждый класс в отдельном файле)
# Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, 
# который будет содержать общие методы и свойства
# Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию. 
# В комментарии к методу обосновать, почему он был вынесен в private/protected
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 
# При добавлении вагона к поезду, объект вагона должен сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, 
# где мы считали только кол-во вагонов. Параметр конструктора "кол-во вагонов" при этом можно удалить.
# Усложненное задание: создать программу в файле main.rb, которая будет позволять пользователю через текстовый интерфейс делать следующее:
#      - Создавать станции
#      - Создавать поезда
#      - Добавлять вагоны к поезду
#      - Отцеплять вагоны от поезда
#      - Помещать поезда на станцию
#      - Просматривать список станций и список поездов на станции


require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'passenger_train.rb'
require_relative 'passenger_carriage.rb'
require_relative 'cargo_train.rb'
require_relative 'cargo_carriage.rb'


info =  <<TEXT
Список методов в классах:
      
      Station:
            initialize(name)

            add_train(train)
            delete_train(train)
            print_all_trains

      Train:
            initialize(num, type)

            accelerate
            stop
            print_speed

            add_carriage
            delete_carriage
            print_all_carriage

            accept_route(route)
            print_next_station
            print_prev_station
            go_next_station
            go_prev_station

      Route: 
            initialize(first, last)

            add_station(station)
            delete_station(station)
            print_all_stations

TEXT
puts info

