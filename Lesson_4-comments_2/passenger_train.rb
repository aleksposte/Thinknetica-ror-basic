
# Разделить поезда на два типа PassengerTrain и CargoTrain, сделать родителя для классов, 
# который будет содержать общие методы и свойства

# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы). 
# К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые. 
# При добавлении вагона к поезду, объект вагона 
# должен сохраняться во внутреннем массиве поезда, в отличие от предыдущего задания, 
# где мы считали только кол-во вагонов. 
# Параметр конструктора "кол-во вагонов" при этом можно удалить.

class PassengerTrain < Train

  attr_accessor :passenger
                # :type

  def initialize(num)
      super
      @type = :passenger
  end
  

  # Старый вариант
  
  # def add_carriage(carriage)
  #   if @speed != 0
  #     puts "Cначала остановите поезд!"
  #   elsif 
  #     carriage.type != 'passenger'
  #     puts "Это вагон не являеться Пассажирским"
  #   else
  #     self.carriages_all.push(carriage)
  #     puts "У поезда #{num} Пассажирских вагонов: #{self.carriages_all.size}"
  #   end
  # end

  # def delete_carriage(carriage)
  #   if @speed != 0
  #     puts "Cначала остановите поезд!"
  #   else
  #     self.carriages_all.delete(carriage)
  #     puts "Удален вагон, в составе осталось #{self.carriages_all.size} вагонов"
  #   end
  # end

end



