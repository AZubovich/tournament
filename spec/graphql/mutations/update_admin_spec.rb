require 'rails_helper'
module Mutations
  RSpec.describe UpdateAdmin, type: :request do
    describe '.resolve' do
        let(:schema) { BackendSchema }
        it 'returns a user status' do
          user = create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName', admin: false)
          user.reload
          #post '/graphql', params: { query: update_query }
          schema.execute(query: update_query)
          user.reload
          expect(user.admin).to eq(true)
        end
    end


    def update_query
      <<~GQL
        mutation {
          updateAdmin(
            nickName: "thirdName"
          ) {
            user{
              id
              email
              nickName
              admin
            }
            }
        }
      GQL
    end
  end
end