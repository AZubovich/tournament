require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all users' do
        author1 = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName', community_id: 1)
        author2 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName', community_id: 2)
        author3 = create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName', community_id: 3)
        create(:community, title: 'First', description: 'First description', creator: author1.nick_name, limit: 8)
        create(:community, title: 'Second', description: 'Second description', creator: author2.nick_name, limit: 7)
        create(:community, title: 'Third', description: 'Third description', creator: author3.nick_name, limit: 6)
  

        #post '/graphql', params: { query: find_tournaments_query }
        temp = schema.execute(query: find_tournaments_query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "findCommunity" => { 
              "id" => "1",
              "title" => "First",
              "description" => "First description",
              "creator" => "firstName",
              "limit" => 8,
            }
        }}
        expect(data).to eq(json_client)
      end
    end

    def find_tournaments_query
      <<~GQL
        query {
          findCommunity(
          token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              title
              description
              creator
              limit
            }
        }
      GQL
    end
  end
end