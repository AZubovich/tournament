module Tour
  class << self
    def create_regular_games(tour)
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
            first_player_time: 0,
            second_player_time: 0,
            task_id: task.id
          )
        end
      end
    end
    def create_playoff_games(tour)
      amount = tour.players.where(round: tour.round).count - 1
      players = tour.players.where(round: tour.round).order(id: :asc).to_a
      i = 0
      while i < amount
        j = i + 1
        task = Task.offset(rand(Task.count)).first
        Game.create(
          first_player_name: players[i].nick_name,
          second_player_name: players[j].nick_name,
          status: 'active',
          tournament_id: tour.id,
          first_player_time: 0,
          second_player_time: 0,
          task_id: task.id
        )
        i += 2
      end
    end
    def over(tour)
      if(tour.games.where(status: "active").count == 0)
        if tour.kind == "Regular"
          tour.status = "ended"
        end
        if tour.kind == "Play-off"
          tour.round +=1
          tour.players.where(round: tour.round).count == 1 ? tour.status = "ended" : tour.status = nil
        end
        tour.save
      end
    end
  end
end
