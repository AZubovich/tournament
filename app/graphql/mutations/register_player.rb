module Mutations
  class RegisterPlayer< BaseMutation

    argument :token, String, required: true
    argument :tour_id, ID, required: true

    field :player, Types::PlayerType, null: true

    def resolve(token:, tour_id:)
      user = Current.current_user(token)
      tournament = Tournament.find_by(id: tour_id)
      player = Player.create(
        nick_name: user.nick_name,
        points: 0,
        user_id: user.id,
        tournament_id: tournament.id
      )
      
      { player: player }

    end
  end
end
