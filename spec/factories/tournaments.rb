# == Schema Information
#
# Table name: tournaments
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  prize       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_tournaments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :tournament do
    name { "MyName" }
    description { "MyDescription" }
    prize { 1 }
    user { create(:user) }
  end
end
