# == Schema Information
#
# Table name: tournaments
#
#  id                 :bigint           not null, primary key
#  description        :text
#  kind               :string
#  limit              :integer
#  name               :string
#  prize              :integer
#  prize_distribution :string
#  prize_winner       :integer
#  round              :integer
#  status             :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :bigint
#
# Indexes
#
#  index_tournaments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Tournament, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
