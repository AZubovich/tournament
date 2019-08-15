module Current
  def self.attribute(attribute_name, default = nil)
    define_singleton_method(attribute_name) do
      store[attribute_name] ||= default&.call
    end

    define_singleton_method(:"#{attribute_name}=") do |value|
      store[attribute_name] = value
    end
  end

  attribute :user
  attribute :session
  
  class << self
   private

	  def store
	    RequestStore.store
	  end
  end
end
