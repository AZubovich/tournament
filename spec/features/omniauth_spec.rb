require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GitHub" do
    it "authentication by github" do
      visit root_path
      click_link 'GitHub'
      User.last.uid.should == '123545'
    end
  end
end
