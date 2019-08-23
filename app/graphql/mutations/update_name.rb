module Mutations
  class UpdateName < BaseMutation
    argument :nick_name, String, required: true
    argument :token, String, required: true
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:, token:)
      #user = context[:current_user]
      user = Current.current_user(token)
      user.update(
        nick_name: nick_name
      )
      { user: user }
    end
  end
end

