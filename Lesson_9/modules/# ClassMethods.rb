 # ClassMethods
  module ClassMethods
    attr_accessor :validations

    def validate(name, type, args = '')
      self.validations ||= []
      rule = { type => { name: name, args: args } }
      validations << rule
    end
  end

  # InstanceMethods
  module InstanceMethods
    def validate!
      validations = self.class.validations
      validations.each do |rule|
        rule.each do |type, params|
          var_to_check = get_instance_var_by_name(params[:name])
          send(type, var_to_check, params[:args])
        end
      end
    end

    def valid?
      validate!
    rescue
      true
    end

    protected

    def presence(var_to_check, _args)
      raise 'Значение атрибута не должно быть пустым' if var_to_check.nil? || var_to_check.empty?
    end

    def format(var_to_check, format)
      raise 'Введенное значение не соответствует формату!' if var_to_check !~ format
    end

    def type(var_to_check, attr_class)
      raise 'Объект не принадлежит к нужному классу!' unless attr_class.include? var_to_check
    end

    def get_instance_var_by_name(name)
      var_name = "@#{name}".to_sym
      instance_variable_get(var_name)
    end
  end