# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
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

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User should be valid' do
    user = User.new(email: 'opp@gn.ru', password: '123456')
    expect(user).to be_valid
  end

  it 'User should be invalid(not a email)' do
    user1 = User.new(email: 'oppgn.ru', password: '123456')
    expect(user1).to_not be_valid
  end

  it 'User should be invalid(password blank)' do
    user2 = User.new(email: 'oppgn.ru', password: nil)
    expect(user2).to_not be_valid
  end
  it 'User with FactoryBot' do
    user4 = create(:user)
    expect(user4.email).to eq('z@m.ru')
  end
end
