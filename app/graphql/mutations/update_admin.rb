module Mutations
  class UpdateAdmin < BaseMutation
    argument :nick_name, String, required: true
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:)
      #user = context[:current_user]
      user = User.find_by(nick_name: nick_name)
      if user.admin
        user.update(
          admin: false
        )
      else
        user.update(
          admin: true
        )
      end
      { user: user }
    end
  end
end
