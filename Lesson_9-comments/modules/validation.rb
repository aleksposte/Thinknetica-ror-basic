# module Validate
#   def valid?
#     validate!
#     true
#   rescue
#     false
#   end
# end

# Написать модуль Validation, который:

# Содержит метод класса validate. Этот метод принимает в качестве параметров 
# имя проверяемого атрибута, а также тип валидации и 
# при необходимости дополнительные параметры.Возможные типы валидаций:

#    - presence - требует, чтобы значение атрибута было не nil и не пустой строкой.
#     Пример использования:  
 
# validate :name, :presence
 
#   - format (при этом отдельным параметром задается регулярное выражение для формата).
#    Треубет соответствия значения атрибута заданному регулярному выражению. Пример:  
 
# validate :number, :format, /A-Z{0,3}/
 
#  -  type (третий параметр - класс атрибута). 
#  Требует соответствия значения атрибута заданному классу. 
#  Пример:  
 
# validate :station, :type, RailwayStation
 
#  Содержит инстанс-метод validate!, который запускает все проверки (валидации), 
#  указанные в классе через метод класса validate. 
#  В случае ошибки валидации выбрасывает исключение с сообщением о том, 
#  какая именно валидация не прошла
# Содержит инстанс-метод valid? который возвращает true, 
# если все проверки валидации прошли успешно и false, если есть ошибки валидации.

module Validation

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module ClassMethods
    attr_accessor :validations

    def validate(name, type, arg = "")
      self.validations ||= []
      rule = { type => { name: name, arg: arg } }
      validations << rule
    end
  end
  

  module InstanceMethods
    
    def validate!
      validations = self.class.validations
      validations.each do |rule|
        rule.each do |type, params|
          value = get_instance_var_by_name(params[:name])
          send(type, value, params[:arg])
        end
      end
    end

    def valid?
      validate!
      true
    rescue
      false
    end

    protected

    def presence(value, arg)
      raise "Значение не должно быть пустым" if value.nil? || value.empty?
    end

    def format(value, format)
      raise "Значение не соответствует формату" if value !~ format
    end

    def type(value, attribute_class)
      raise "Объект не соответствует классу" unless attribute_class.include? value
    end

    def get_instance_var_by_name(name)
      var_name = "@#{name}".to_s
      instance_variable_get(var_name)
    end
  end
  
  
end