module Types
  class MutationType < Types::BaseObject
    field :enter, UserType, null: true do
      description 'Sign_in for users'
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def enter(email:, password:)
      user = User.find_for_authentication(email: email)
      return nil if !user

      is_valid_for_auth = user.valid_for_authentication?{
        user.valid_password?(password)
      }
      return is_valid_for_auth ? user : nil
    end
  end
end
