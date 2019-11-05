require 'rails_helper'
module Mutations
  RSpec.describe DeleteParticipant, type: :request do
    describe '.resolve' do
        let(:schema) { BackendSchema }
        it 'returns a participant' do
          user = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName', community_id: 1)
          user1 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName', community_id: 1)
          create(:community, title: 'First', description: 'First description', creator: user.nick_name, limit: 8)

  
          user1.reload
          #post '/graphql', params: { query: update_query }
          schema.execute(query: update_query)
          user1.reload
          expect(user1.community_id).to eq(nil)
        end
    end


    def update_query
      <<~GQL
        mutation {
          deleteParticipant(
            nickName: "secondName"
            token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
            user{
              id
              communityId
            }
            }
        }
      GQL
    end
  end
end