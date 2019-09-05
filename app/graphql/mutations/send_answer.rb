module Mutations
  class SendAnswer < BaseMutation
    argument :id, ID, required: true
    argument :token, String, required: true
    argument :answer, String, required: false
    argument :timer, Int, required: false
    type String

    def resolve(token:, id:, answer:, timer:)
      timer1 = (Time.now.to_f * 1000).to_i
      puts "Its Time of Ruby: #{timer1}"
      puts "Its distinct of times: #{timer1 - timer}"
      total = timer1 - timer
      game = Game.find_by(id: id)
      user = Current.current_user(token)
      task = Task.find_by(id: game.task_id)
      lol = eval(answer)
      puts "This is eval: #{lol}"
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
      if(game.first_player_id!=nil && game.second_player_id!=nil)
        game.status = "ended"
        if(game.first_player_time < game.second_player_time)
          player = Player.find_by(nick_name: game.first_player_name, tournament_id: game.tournament_id)
          player.points+=1
          player.save
        else
          player = Player.find_by(nick_name: game.second_player_name, tournament_id: game.tournament_id)
          player.points+=1
          player.save
        end
      end
      game.save
      if(Tournament.find_by(id: game.tournament_id).games.where(status: "active").count == 0)
        tour = Tournament.find_by(id: game.tournament_id)
        tour.status = "ended"
        tour.save
      end
      message
    end
  end
end
