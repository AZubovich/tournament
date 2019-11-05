require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456',  nick_name: 'firstName')
        author1 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')
        create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author.id)
        create(:tournament, name: 'Second', description: 'Second description', prize: 300, kind: 'Play-off', limit: 4, user_id: author1.id)
  

        #post '/graphql', params: { query: user_tournaments_query }


        temp = schema.execute(query: user_tournaments_query)

        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "userTournaments" => [{
              "id" => "1",
              "name" => "First",
              "description" => "First description",
              "prize" => 200,
              "kind" => "Regular",
              "limit" => 8,
              "userId" => "1",
            }
          ]
        }}
        expect(data).to eq(json_client)
      end
    end

    def user_tournaments_query
      <<~GQL
        query {
          userTournaments(
            token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              name
              description
              prize
              kind
              limit
              userId
            }
        }
      GQL
    end
  end
end