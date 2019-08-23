module Types
  class TournamentType < BaseObject
    field :id, ID, null: false
    field :user_id, ID, null: false
    field :name, String, null: true
    field :description, String, null: true
    field :prize, Int, null: true
  end
end