# == Schema Information
#
# Table name: achievements
#
#  id          :bigint           not null, primary key
#  badge_url   :string
#  description :text
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_achievements_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :achievement do
    description { "MyText" }
    badge_url { "MyString" }
    user { nil }
  end
end
