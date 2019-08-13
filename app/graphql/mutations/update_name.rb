module Mutations
  class UpdateName < BaseMutation
    argument :nick_name, String, required: true
    
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:)
      user = context[:current_user]
      user.update(
        nick_name: nick_name
      )
      { user: user }
    end
  end
end
