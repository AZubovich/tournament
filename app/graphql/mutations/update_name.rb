module Mutations
  class UpdateName < BaseMutation
    argument :nick_name, String, required: true
    argument :token, String, required: true
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:, token:)
      user = Current.current_user(token)
      player = Player.where(user_id: user.id)
      game1 = Game.where(first_player_name: user.nick_name)
      game2 = Game.where(second_player_name: user.nick_name)
      user.update(
        nick_name: nick_name
      )
      player.update(
        nick_name: nick_name
      )
      if game1!=nil
        game1.update(
          fisrt_player_name: nick_name
        )
      end
      if game2!=nil
        game2.update(
          second_player_name: nick_name
        )
      end
      { user: user }
    end
  end
end

