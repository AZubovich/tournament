module Mutations
  class RegisterPlayer < BaseMutation
    argument :token, String, required: true
    argument :tour_id, ID, required: true
    argument :money, String, required: true
    field :player, Types::PlayerType, null: true

    def resolve(token:, tour_id:, money:)
      user = Current.current_user(token)
      tournament = Tournament.find_by(id: tour_id)
      nil if tournament.players.find_by(user_id: user.id)
      player = Player.create(
        nick_name: user.nick_name,
        points: 0,
        round: 0,
        user_id: user.id,
        tournament_id: tournament.id
      )
      bet = Bet.create(
        money: money.to_i,
        tournament_id: tournament.id,
        player_id: player.id
      )
      tournament.prize += bet.money
      tournament.save
      { player: player }
    end
  end
end
