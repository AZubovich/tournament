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
#  player_id          :bigint
#  second_player_id   :integer
#  task_id            :integer
#  tournament_id      :bigint
#
# Indexes
#
#  index_games_on_player_id      (player_id)
#  index_games_on_tournament_id  (tournament_id)
#
# Foreign Keys
#
#  fk_rails_...  (player_id => players.id)
#  fk_rails_...  (tournament_id => tournaments.id)
#

class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :player
end
