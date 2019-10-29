class Community < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :limit, presence: true
end
