# Создать модуль InstanceCounter, 
# содержащий следующие методы класса и инстанс-методы, 
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
#        - instances, который возвращает кол-во экземпляров данного класса
# Инастанс-методы:
#        - register_instance, который увеличивает счетчик кол-ва экземпляров класса 
#        и который можно вызвать из конструктора.
#         При этом данный метод не должен быть публичным.

module InstanceCounter

# Можно сразу receiver.include InstanceMethods.
  def self.included(receiver)
    receiver.extend            ClassMethods
    receiver.send :include,    InstanceMethods
  end

  module ClassMethods
    
    @@instances = -1

    def instances
      @@instances += 1
    end

  end
  
  module InstanceMethods
    
  end
end

  
  # Можно сразу receiver.include InstanceMethods.
  # def self.included(receiver)
  #   receiver.extend     Instances
  #   receiver.send :include,    InstanceMethods
  # end

