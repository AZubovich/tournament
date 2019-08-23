module Mutations
  class UpdatePassword < BaseMutation
    argument :password, String, required: true
    argument :passwordConfirmation, String, required: true
    argument :token, String, required: true
    #type Types::UserType
    field :user, Types::UserType, null: true

    def resolve(password:, password_confirmation:, token:)
      #user = context[:current_user]
      user = Current.current_user(token)
      user.update(
        password: password,
        password_confirmation: password_confirmation
      )
      { user: user }
    end
  end
end
