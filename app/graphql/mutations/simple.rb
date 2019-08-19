module Mutations
  class Simple < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :confirm, String, required: true
    type Types::UserType

    def resolve(email:, password:, confirm:)
      User.create(
        email: email,
        password: password,
        password_confirmation: confirm
      )
    end
  end
end
