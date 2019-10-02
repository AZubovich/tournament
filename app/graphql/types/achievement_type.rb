module Types
  class AchievementType < BaseObject
    field :id, ID, null: false
    field :description, String, null: true
    field :image_url, String, null: true
    field :user_id, ID, null: false
  end
end
