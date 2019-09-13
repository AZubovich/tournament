module Mutations
  class SendAnswer < BaseMutation
    argument :id, ID, required: true
    argument :token, String, required: true
    argument :answer, String, required: false
    argument :timer, Int, required: false
    type String

    def resolve(token:, id:, answer:, timer:)
      timer1 = (Time.now.to_f * 1000).to_i
      total = timer1 - timer
      game = Game.find_by(id: id)
      user = Current.current_user(token)
      task = Task.find_by(id: game.task_id)
      tour = Tournament.find_by(id: game.tournament_id)
      begin
        lol = eval(answer)
        message = Result.set_time(user, game, total, task, lol)
      rescue StandardError => e
        puts "This is error message:#{e.message}"
        message = e.message
      end
      Result.set_result(game, tour)
      game.save
      Tour.over(tour)
      message
    end
  end
end
