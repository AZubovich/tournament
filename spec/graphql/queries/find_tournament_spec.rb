require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        tours = create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author.id)
        create(:tournament, name: 'Second', description: 'Second description', prize: 300, kind: 'Play-off', limit: 4, user_id: author.id)
  

        #post '/graphql', params: { query: find_tournaments_query }
        temp = schema.execute(query: find_tournaments_query)
        data = JSON.parse(temp.to_json)['data']['findTournament']
        expect(data).to include(
              { "id" => "1",
                "name" => "First",
                "description" =>"First description",
                "prize" => 200,
                "kind" => "Regular",
                "limit" => 8,
                "userId"=> "1"
              }
         )
      end
    end

    def find_tournaments_query
      <<~GQL
        query {
          findTournament(
            id: "1"
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