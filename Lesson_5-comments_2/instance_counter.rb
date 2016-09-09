# Создать модуль InstanceCounter, 
# содержащий следующие методы класса и инстанс-методы, 
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
#        - instances, который возвращает кол-во экземпляров данного класса
# Инастанс-методы:
#        - register_instance, который увеличивает счетчик кол-ва экземпляров класса 
#        и который можно вызвать из конструктора.
#         При этом данный метод не должен быть публичным.
# module InstanceCounter

module InstanceCounter
attr_accessor :instances

  def self.included(receiver)
    receiver.extend         ClassMethods 
    receiver.send :include, InstanceMethods 
  end
module ClassMethods
    def instances_count
      @instances ||= 0
      @instances += 1
    end

  def instances
      @instances
   end
  end

  module InstanceMethods
   
    private
    def register_instance
      self.class.instances_count
    end
  end
end

 
  # Можно сразу receiver.include InstanceMethods. - у меня выдает ошибку :(
  # def self.included(receiver)
  #   receiver.extend     Instances
  #   receiver.send :include,    InstanceMethods
  # end

