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
#  round       :integer
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
require 'faker'
FactoryBot.define do
  factory :tournament do
    name { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    prize { 1 }
    kind { "Regular" }
    limit { 4 }
    user { create(:user) }

    factory :tournament_with_players do
      after(:create) do |tournament, _evaluator|
        tournament.players << build(:player)
        tournament.players << build(:player)
        tournament.players << build(:player)
      end

      factory :tournament_with_games do
        after(:create) do |tournament, _evaluator|
          tournament.games << build(:game,
            first_player_name: tournament.players.first.nick_name,
            second_player_name: tournament.players.last.nick_name)
        end
      end
    end
  end
end
