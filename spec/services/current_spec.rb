require 'spec_helper'
require 'rails_helper'

describe Current do
  let(:user) { create(:user)}
  it "get a current user" do
    puts "User id is:#{user.id}"
    token = "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
    expect(Current.current_user(token).id).to eq(user.id)
  end
end
