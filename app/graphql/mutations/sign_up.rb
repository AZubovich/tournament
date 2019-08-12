module Mutations
  class SignUp < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :passwordConfirmation, String, required: true

    type Types::UserType

    def resolve(email:, password:, password_confirmation:)
      nick_name = context[:nickname]
      user = User.create(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        nick_name: nick_name
      )
      context[:session][:user] = user.id
      user
    end
  end
end
