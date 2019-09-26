module Mutations
  class CreateTask < BaseMutation
    argument :description, String, required: true
    argument :answer, String, required: true

    field :task, Types::TaskType, null: true

    def resolve(description:, answer:)
      task = Task.create(
        description: description,
        answer: answer
      )
      { task: task }
    end
  end
end
