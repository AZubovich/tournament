module Mutations
  class SendAnswer < BaseMutation
    argument :id, ID, required: true
    argument :token, String, required: true
    argument :answer, String, required: false

    type String

    def resolve(token:, id:, answer:)
      game = Game.find_by(id: id)
      user = Current.current_user(token)
      task = Task.find_by(id: game.task_id)
      lol = eval(answer)
      puts "This is eval: #{lol}"
      if lol.to_s == task.answer
        message = "Congratulations! You solve it!"
      else
        message = "Sorry, you have a mistake"
      end
      message
    end
  end
end