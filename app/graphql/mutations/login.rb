module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, Integer, null: true
    
    def resolve(email:, password:)
      puts "Before login #{context[:session][:token]}"
      user = User.find_for_authentication(email: email)
      return nil if !user

      is_valid_for_auth = user.valid_for_authentication?{
        user.valid_password?(password)
      }
      context[:session][:token] = user.id if is_valid_for_auth
      puts "After login #{context[:session][:token]}"
      return nil unless is_valid_for_auth
      { user: user, token: context[:session][:token] }
    end
  end
end
