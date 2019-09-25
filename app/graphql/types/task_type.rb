module Types
  class TaskType < BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :answer, String, null: true
  end
end