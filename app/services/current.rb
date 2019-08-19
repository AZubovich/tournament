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
    
    def current_user
      return unless session[:token]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.decrypt_and_verify session[:token]
      user_id = token.gsub('user-id:', '').to_i
      User.find_by(id: user_id)
    end
	  def store
	    RequestStore.store
	  end
  end
end
