require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'route.rb'

puts "Список методов в классах"

puts "Station: \n
      accept_train(train_name, train_type) \n 
      depart_train(train_name) \n 
      all_trains\n\n"

puts "Route: \n
      add_station(name_add_station) \n 
      delete_station(name_add_station) \n 
      all_stations \n\n"

puts "Train: \n
      go=(speed) \n 
      stop \n 
      current_speed \n

      add_carriage \n
      delete_carriage \n
      all_carriage \n 

      route_train(list_stations) \n
      next_station \n
      prev_station \n

      go_next_station \n
      go_prev_station \n"