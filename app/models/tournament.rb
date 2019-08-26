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

class Tournament < ApplicationRecord
  belongs_to :user
  has_many :players, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :prize, presence: true
  validates :kind, presence: true
  validates :limit, presence: true
end
