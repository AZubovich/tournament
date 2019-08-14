module Mutations
  class UpdateName < BaseMutation
    argument :nick_name, String, required: true
    #field :user, Types::UserType, null: true
    type Types::UserType
    
    def resolve(nick_name:)
      puts "Its context[:session] #{context[:session]}"
      user = Current.user
      user = user.update(
        nick_name: nick_name
      )
      user
    end
  end
end
