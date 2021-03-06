# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  money                  :integer
#  nick_name              :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  super_admin            :boolean
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'faker'
FactoryBot.define do
  factory :user do
    sequence(:email) { Faker::Internet.email }
    sequence(:password) { '123456' }
    sequence(:password_confirmation) { '123456' }
    sequence(:nick_name) { Faker::Internet.username }
    sequence(:admin) { false }
  end
end
