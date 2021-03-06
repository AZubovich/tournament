module Types
  class TournamentType < BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :prize, Int, null: true
    field :kind, String, null: true
    field :round, Int, null: true
    field :limit, Int, null: true
    field :status, String, null: true
    field :prize_winner, Int, null: true
    field :prize_distribution, String, null: true
    field :players, [Types::PlayerType], null: true
    field :games, [Types::GameType], null: true
  end
end
