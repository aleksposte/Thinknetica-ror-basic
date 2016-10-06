# Написать модуль Acessors, содержащий следующие методы, 
# которые можно вызывать на уровне класса:

# метод  
# attr_accessor_with_history
#  Этот метод динамически создает геттеры и сеттеры для любого кол-ва атрибутов, 
#  при этом сеттер сохраняет все значения инстанс-переменной 
#  при изменении этого значения. 
# Также в класс, в который подключается модуль должен добавляться инстанс-метод
 
# <имя_атрибута>_history
#   который возвращает массив всех значений данной переменной.

# метод 
 
# strong_attr_acessor
 
#  который принимает имя атрибута и его класс. 
#  При этом создается геттер и сеттер для одноименной инстанс-переменной, 
#  но сеттер проверяет тип присваемоего значения. 
#  Если тип отличается от того, который указан вторым параметром, 
#  то выбрасывается исключение. Если тип совпадает, то значение присваивается.

module Accessors

  def self.included(receiver)
    receiver.extend         ClassMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*methods)
      methods.each do |method|
        name_method = "@#{method}"
        history_method = "@#{method}_history"
        define_method(method) {instance_variable_get(name_method)}
        define_method("#{method}_history") {instance_variable_get(history_method)}

        define_method("#{method}=") do |value|
          if instance_variable_get(history_method).nil?
            instance_variable_set(history_method, [instance_variable_get(name_method)])
          else
            instance_variable_get(history_method) << instance_variable_get(name_method)
          end
          instance_variable_set(name_method, value)
        end
      end
    end
  end

  def strong_attr_acessor(name, type)
    name = "@#{name}"
    define_method(name) {instance_variable_get(name)}
    define_method("@#{name}=") do |value|
      if value.is_a?(type)
        instance_variable_set(name, value)
      else 
        raise TypeError
      end
    end
  end

end