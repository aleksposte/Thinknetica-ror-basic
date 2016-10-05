module InstanceCounter
  attr_reader :instances

  def self.included(receiver)
    receiver.extend ClassMethods
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
