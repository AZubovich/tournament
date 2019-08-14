module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, Integer, null: true
    
    def resolve(email:, password:)
      puts "Before login #{context[:session][:current_user_id]}"
      user = User.find_for_authentication(email: email)
      return nil if !user

      is_valid_for_auth = user.valid_for_authentication?{
        user.valid_password?(password)
      }
      if is_valid_for_auth
        Current.user = user
      end
      puts "After login #{context[:session][:current_user_id]}"
      return nil unless is_valid_for_auth
      { user: user, token: user.id }
    end
  end
end
