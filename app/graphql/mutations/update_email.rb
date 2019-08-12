module Mutations
  class UpdateEmail < BaseMutation
    argument :email, String, required: true

    type Types::UserType

    def resolve(email:)
      user = context[:current_user]
      user.update(
        email: email
      )
      user
    end
  end
end
