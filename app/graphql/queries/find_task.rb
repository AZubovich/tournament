module Queries
  class FindTask < Queries::BaseQuery
    description 'Get necessary task'

    argument :id, ID, required: true
    type Types::TaskType, null: true

    def resolve(id:)
      game = Game.find_by(id: id)
      Task.find_by(id: game.task_id)
    end
  end
end