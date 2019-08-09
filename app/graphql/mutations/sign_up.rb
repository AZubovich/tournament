module Mutations
  class SignUp < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :passwordConfirmation, String, required: true

    type Types::UserType

    def resolve(email:, password:, password_confirmation:)
      User.create(
        email: email,
        password: password,
        password_confirmation: password_confirmation
      )
    end
  end
end
