# == Schema Information
#
# Table name: players
#
#  id            :bigint           not null, primary key
#  nick_name     :string
#  points        :integer
#  round         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  tournament_id :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_players_on_tournament_id  (tournament_id)
#  index_players_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (tournament_id => tournaments.id)
#  fk_rails_...  (user_id => users.id)
#

class Player < ApplicationRecord
  belongs_to :user
  belongs_to :tournament
  validates :nick_name, presence: true
  scope :regular_order, ->(item) { where(tournament_id: item).order(points: :desc, nick_name: :asc) }
  scope :playoff_order, ->(item) { where(tournament_id: item).order(id: :asc) }
  scope :playoff_final_order, ->(item) { where(tournament_id: item).order(round: :desc, nick_name: :asc) }
  scope :on_this_round, ->(round) { where(round: round) }
end
