require 'rails_helper'

RSpec.describe PagesController, type: :controller do
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

  describe 'sign_in and aign_out process'
    it 'signs user in and out' do
      user = create(:user)
      sign_in user
      get :profile
      expect(response).to render_template(:profile)
      sign_out user
      get :profile
      expect(response).to render_template(:profile)
    end
end
