module Queries
  class PlayerGames < Queries::BaseQuery
    description 'Get necessary games'

    argument :token, String, required: true
    argument :tour_id, ID, required: true
    type [Types::GameType], null: true

    def resolve(token:, tour_id:)
      user = Current.current_user(token)
      tour = Tournament.find_by(id: tour_id)
      player = Player.find_by(user_id: user.id, tournament_id: tour.id)
      tour.games.first_player_games(player.nick_name).or(tour.games.second_player_games(player.nick_name))
    end
  end
end
