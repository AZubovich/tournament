module Types
  class PlayerType < BaseObject
    field :id, ID, null: false
    field :nick_name, String, null: true
    field :points, Int, null: true
    field :round, Int, null: true
    field :user_id, ID, null: true
    field :tournament_id, ID, null: true
  end
end