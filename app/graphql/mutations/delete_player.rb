module Mutations
  class DeletePlayer < BaseMutation
    argument :token, String, required: true
    argument :tour_id, ID, required: true

    type Boolean

    def resolve(token:, tour_id:)
      user = Current.current_user(token)
      tour = Tournament.find_by(id: tour_id)
      player = Player.find_by(user_id: user.id, tournament_id: tour.id)
      bet = Bet.find_by(player_id: player.id, tournament_id: tour.id)
      tour.prize -= bet.money
      tour.save
      bet.destroy
      player.destroy
      true
    end
  end
end
