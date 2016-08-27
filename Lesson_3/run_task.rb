require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

info =  <<TEXT
Список методов в классах:
      
      Station:
            initialize(name)

            add_train(train)
            delete_train(train)
            print_all_trains

      Train:
            initialize(num, type)

            go=(speed)
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