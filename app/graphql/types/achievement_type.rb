module Types
  class AchievementType < BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :badge_url, String, null: true
    field :image, String, null: true
    field :user_id, ID, null: false
  end
end
