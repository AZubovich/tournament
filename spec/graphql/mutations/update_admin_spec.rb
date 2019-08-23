require 'rails_helper'
module Mutations
  RSpec.describe UpdateAdmin, type: :request do
    describe '.resolve' do
        let(:user) { create(:user) }
        let(:schema) { GraphQL::BackendSchema }
        it 'returns a user status' do
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
            nickName: "exampleName"
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