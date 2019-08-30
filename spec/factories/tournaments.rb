# == Schema Information
#
# Table name: tournaments
#
#  id          :bigint           not null, primary key
#  description :text
#  kind        :string
#  limit       :integer
#  name        :string
#  prize       :integer
#  status      :string
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
    kind { "Regular" }
    limit { 4 }
    user { create(:user) }
  end
end
