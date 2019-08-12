module Mutations
  class Login < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(email:, password:)
      puts "Before login #{context[:session][:user]}"
      user = User.find_for_authentication(email: email)
      return nil if !user

      is_valid_for_auth = user.valid_for_authentication?{
        user.valid_password?(password)
      }
      context[:session][:user] = user.id if is_valid_for_auth
      puts context[:session][:user]
      return is_valid_for_auth ? user : nil
    end
  end
end
