module Types
  class BetType < BaseObject
    field :id, ID, null: false
    field :money, Int, null: true
    field :player_id, ID, null: true
    field :tournament_id, ID, null: true
  end
end