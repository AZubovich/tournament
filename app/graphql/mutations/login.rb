module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true


    field :user, Types::UserType, null: true
    field :token, String, null: true
    
    def resolve(email:, password:)
      user = User.find_for_authentication(email: email)
      return nil if !user

      is_valid_for_auth = user.valid_for_authentication?{
        user.valid_password?(password)
      }

      if is_valid_for_auth
        crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
        token = crypt.encrypt_and_sign("user-id:#{ user.id }")
        context[:session][:token] = token
      end
      return nil unless is_valid_for_auth
      { user: user, token: token }

    end
  end
end
