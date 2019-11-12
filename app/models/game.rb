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

class Game < ApplicationRecord
  belongs_to :tournament
  scope :first_player_games, ->(nickname) { where(first_player_name: nickname, first_player_id: nil) }
  scope :second_player_games, ->(nickname) { where(second_player_name: nickname, second_player_id: nil) }
  scope :active, -> { where(status: 'active') }
end
