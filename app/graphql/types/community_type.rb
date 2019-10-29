module Types
  class CommunityType < BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :description, String, null: true
    field :limit, Int, null: true
    field :creator, String, null: true
  end
end
