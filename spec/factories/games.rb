# == Schema Information
#
# Table name: games
#
#  id                 :bigint           not null, primary key
#  first_player_name  :string
#  first_player_time  :integer
#  second_player_name :string
#  second_player_time :integer
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  first_player_id    :integer
#  second_player_id   :integer
#  task_id            :integer
#  tournament_id      :bigint
#
# Indexes
#
#  index_games_on_tournament_id  (tournament_id)
#
# Foreign Keys
#
#  fk_rails_...  (tournament_id => tournaments.id)
#
require 'faker'
FactoryBot.define do
  factory :game do
    first_player_id { nil }
    second_player_id { nil }
    first_player_time { 0 }
    second_player_time { 0 }
    task_id { 1 }
    first_player_name { "first" }
    second_player_name { "second" }
    status { "active" }
    tournament
  end
end
