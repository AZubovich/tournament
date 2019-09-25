module ServiceTour
  class << self
    def create_regular_games(tour)
      amount = tour.players.count - 1
      players = tour.players.to_a
      (0...amount).each do |i|
        (i + 1..amount).each do |j|
          task = Task.offset(rand(Task.count)).first
          create_game(players[i].nick_name, players[j].nick_name, tour.id, task.id)
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
        create_game(players[i].nick_name, players[j].nick_name, tour.id, task.id)
        i += 2
      end
    end

    def over(tour)
      if(tour.games.where(status: 'active').count == 0)
        tour.status = 'ended' if tour.kind == 'Regular'
        if tour.kind == 'Play-off'
          tour.round += 1
          tour.players.where(round: tour.round).count == 1 ? tour.status = 'ended' : tour.status = nil
        end
        tour.save
      end
    end

    def create_game(player1, player2, tour_number, task_number)
      Game.create(
        first_player_name: player1,
        second_player_name: player2,
        status: 'active',
        tournament_id: tour_number,
        first_player_time: 0,
        second_player_time: 0,
        task_id: task_number
      )
    end
  end
end