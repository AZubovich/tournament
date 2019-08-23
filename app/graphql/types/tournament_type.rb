module Types
  class TournamentType < BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :prize, Int, null: true
    field :kind, String, null: true
    field :limit, Int, null: true
  end
end
