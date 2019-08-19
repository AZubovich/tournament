require 'rails_helper'
module Mutations
  RSpec.describe UpdateEmail, type: :request do
    describe '.resolve' do
      let(:user) { create(:user)}
        it 'returns a user' do
          user.reload
          post '/graphql', params: { query: update_query }
          user.reload
          expect(user.password).to eq("654321")
        end       
    end


    def update_query
      <<~GQL
        mutation {
          updatePassword(
            password: "654321"
            passwordConfirmation: "654321"
            token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
            user{
              id
              email
            }
            }
        }
      GQL
    end
  end
end