# == Schema Information
#
# Table name: games
#
#  id                 :bigint           not null, primary key
#  first_player_time  :integer
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

FactoryBot.define do
  factory :game do
    first_player_id { 1 }
    second_player_id { 1 }
    first_player_time { 1 }
    second_player_time { 1 }
    task_id { 1 }
    tournament { nil }
    player { nil }
  end
end
