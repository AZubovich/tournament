require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe 'profile not working' do
    it 'profile not work without authentication' do
      user = User.find_by(id: 2)
      expect(user.nil?).to eq(true)
    end
  end

  describe 'profile working' do
    it 'should show necessery user' do
      @user1 = create(:user)
      login(@user1)
      user = current_user
      expect(user.email).to eq('z@m.ru')
    end
  end

  describe 'GET profile' do
    it 'should be successful(login test also)' do
      @user1 = create(:user)
      login(@user1)
      get :profile
      response.should be_success
    end
  end
end
