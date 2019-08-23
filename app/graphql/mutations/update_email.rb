module Mutations
  class UpdateEmail < BaseMutation
    argument :email, String, required: true
    argument :token, String, required: true
    #type Types::UserType
    field :user, Types::UserType, null: true

    def resolve(email:, token:)
      #user = context[:current_user]
      user = Current.current_user(token)
      user.update(
        email: email
      )
      { user: user }
    end
  end
end
