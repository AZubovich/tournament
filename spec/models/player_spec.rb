# == Schema Information
#
# Table name: players
#
#  id            :bigint           not null, primary key
#  nick_name     :string
#  points        :integer
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

require 'rails_helper'

RSpec.describe Player, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
