module Mutations
  class UpdateEmail < BaseMutation
    argument :email, String, required: true

    #type Types::UserType
    field :user, Types::UserType, null: true

    def resolve(email:)
      user = context[:current_user]
      user.update(
        email: email
      )
      { user: user }
    end
  end
end
