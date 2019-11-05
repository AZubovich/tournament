require 'rails_helper'
module Mutations
  RSpec.describe UpdatePassword, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
        it 'returns a user' do
          user = create(:user, email: 'third@m.ru', password: '111111', password_confirmation: '111111', nick_name: 'thi')
          user.reload
          #post '/graphql', params: { query: update_query }
          schema.execute(query: update_query)
          user.reload
          expect(user.password).to eq("117462")
        end       
    end


    def update_query
      <<~GQL
        mutation {
          updatePassword(
            password: "117462"
            passwordConfirmation: "117462"
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