require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all participants of necessary' do
        author1 = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName', community_id: 1, money: 100)
        author2 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName', community_id: 2, money: 200)
        create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName', community_id: 1, money: 300)
        create(:community, title: 'First', description: 'First description', creator: author1.nick_name, limit: 8)
        create(:community, title: 'Second', description: 'Second description', creator: author2.nick_name, limit: 7)

        #post '/graphql', params: { query: find_tournaments_query }
        temp = schema.execute(query: find_tournaments_query)
        data = JSON.parse(temp.to_json)
        json_client = { 'data' =>
          { 'findParticipants' => [
            { 'id' => '1',
              'email' => 'first@m.ru',
              'nickName' => 'firstName',
              'money' => 100,
            },
            { 'id' => '3',
              'email' => 'third@m.ru',
              'nickName' => 'thirdName',
              'money' => 300,
            }
            ]
        }}
        expect(data).to eq(json_client)
      end
    end

    def find_tournaments_query
      <<~GQL
        query {
          findParticipants(
          token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              email
              nickName
              money
            }
        }
      GQL
    end
  end
end