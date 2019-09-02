module Mutations
  class LaunchTournament < BaseMutation
    argument :tour_id, ID, required: true

    field :games, [Types::GameType], null: true

    def resolve(tour_id:)
      tour = Tournament.find_by(id: tour_id)
      amount = tour.players.count - 1
      players = tour.players.to_a
      (0...amount).each do |i|
        (i + 1..amount).each do |j|
          task = Task.offset(rand(Task.count)).first
          Game.create(
            first_player_id: players[i].id.to_i,
            second_player_id: players[j].id.to_i,
            status: 'active',
            tournament_id: tour.id,
            task_id: task.id
          )
        end
      end
      games = tour.games
      { games: games }
    end
  end
end
