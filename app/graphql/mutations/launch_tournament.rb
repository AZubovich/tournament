module Mutations
  class LaunchTournament < BaseMutation
    argument :id, ID, required: true

    #field :games, [Types::GameType], null: true
    type Boolean

    def resolve(id:)
      tour = Tournament.find_by(id: id)
      amount = tour.players.count - 1
      players = tour.players.to_a
      (0...amount).each do |i|
        (i + 1..amount).each do |j|
          task = Task.offset(rand(Task.count)).first
          Game.create(
            first_player_name: players[i].nick_name,
            second_player_name: players[j].nick_name,
            status: 'active',
            tournament_id: tour.id,
            task_id: task.id
          )
        end
      end
      tour.status = 'active'
      tour.save
      true
    end
  end
end
