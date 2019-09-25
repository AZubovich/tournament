module ServiceResult
  class << self
    def send_message(user, game, total, task, eval_answer)
      if user.nick_name == game.first_player_name
        game.first_player_time += total
        message = create_message(game.first_player_id, user, task, eval_answer)
      else
        game.second_player_time += total
        message = create_message(game.second_player_id, user, task, eval_answer)
      end
      message
    end

    def give_result(game, tour)
      if(game.first_player_id != nil && game.second_player_id != nil)
        game.status = "ended"
        player = game.first_player_time < game.second_player_time ? game.first_player_name : game.second_player_name
        player = Player.find_by(nick_name: player, tournament_id: game.tournament_id)
        tour.kind == "Regular" ? player.points += 1 : player.round += 1
        player.save
      end
    end

    def create_message(player, user, task, eval_answer)
      if eval_answer.to_s == task.answer
        player = user.id.to_i
        message = 'Congratulations! You solve it!'
      else
        message = 'Sorry, you have a mistake'
      end
      message
    end
  end
end
