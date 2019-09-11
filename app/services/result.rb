module Result
  class << self
    def set_time(user, game, total, lol)
      if user.nick_name == game.first_player_name
        game.first_player_time += total
        if lol.to_s == task.answer
          game.first_player_id = user.id.to_i
          message = "Congratulations! You solve it!"
        else
          message = "Sorry, you have a mistake"
        end
      else
        game.second_player_time += total
        if lol.to_s == task.answer
          game.second_player_id = user.id.to_i
          message = "Congratulations! You solve it!"
        else
          message = "Sorry, you have a mistake"
        end
      end
      message
    end
    def set_result(game)
      if(game.first_player_id!=nil && game.second_player_id!=nil)
        game.status = "ended"
        if(game.first_player_time < game.second_player_time)
          player = Player.find_by(nick_name: game.first_player_name, tournament_id: game.tournament_id)
        else
          player = Player.find_by(nick_name: game.second_player_name, tournament_id: game.tournament_id)
        end
        tour.kind == "Regular" ? player.points+=1 : player.round+=1
        player.save
      end
    end
  end
end