module Types
  class GameType < BaseObject
    field :id, ID, null: false
    field :tournament_id, ID, null: false
    field :status, String, null: true
    field :first_player_id, Int, null: true
    field :second_player_id, Int, null: true
    field :first_player_time, Int, null: true
    field :second_player_time, Int, null: true
    field :task_id, Int, null: true
  end
end