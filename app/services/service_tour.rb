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
      amount = tour.players.on_this_round(tour.round).count - 1
      players = tour.players.on_this_round(tour.round).order(id: :asc).to_a
      i = 0
      while i < amount
        j = i + 1
        task = Task.offset(rand(Task.count)).first
        create_game(players[i].nick_name, players[j].nick_name, tour.id, task.id)
        i += 2
      end
    end

    def over(tour)
      if (tour.games.active.count == 0)
        end_of_tournament(tour) if tour.kind == 'Regular'
        if tour.kind == 'Play-off'
          tour.round += 1
          tour.players.on_this_round(tour.round).count == 1 ? end_of_tournament(tour) : tour.status = nil
        end
        tour.save
      end
    end

    def end_of_tournament(tour)
      tour.status = 'ended'
      payment(tour)
      achieve_users(tour)
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

    def payment(tour)
      pays = tour.prize_distribution.split(',')
      players = order_players(tour)
      (0..tour.prize_winner - 1).each do |i|
        user = User.find_by(id: players[i].user_id)
        user.money += pays[i].to_i
        user.save
      end
    end

    def achieve_users(tour)
      players = order_players(tour)
      (0..players.count - 1).each do |i|
        if i <= 2
          user = User.find_by(id: players[i].user_id)
          description = "You have a #{i + 1} place in #{tour.name} tournament"
          create_achievement(description, user.id, i + 1)
        end
      end
    end

    def create_achievement(description, user_id, iter)
      image_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQljWn1IiGDi2El6NEz0SWL5etba-0YOvxydAnFwVI5IXOXceegg' if iter == 1
      image_url = 'https://builder.crownawards.com/StoreFront/ImageCompositionServlet?files=jsp/images/products/STCBG2ND.gif,,&width=378&trim=true' if iter == 2
      image_url = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI6qikTqpZLcVcLlXPfmkfR7bsLZ1IlGq-8dpSKTR76vg10nQQQg' if iter == 3
      Achievement.create(
        description: description,
        image_url: image_url,
        user_id: user_id
      )
    end

    def order_players(tour)
      if tour.kind == 'Regular'
        Player.regular_order(tour.id).to_a
      else
        Player.playoff_final_order(tour.id).to_a
      end
    end
  end
end
