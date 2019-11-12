require 'rails_helper'

module Queries
  RSpec.describe Players, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all players of current tournament' do
        author1 = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        author2 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')

        tour = create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author1.id)
        
        create(:player, nick_name: 'firstName', points: 0, user_id: author1.id, tournament_id: tour.id)
        create(:player, nick_name: 'secondName', points: 0, user_id: author2.id, tournament_id: tour.id)

        #post '/graphql', params: { query: query }

        temp = schema.execute(query: query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "players" => [
            { "id" => "1",
              "nickName" => "firstName",
              "tournamentId" => "1",
              "points" => 0,
              "userId" => "1"
            },
            { "id" => "2", 
              "nickName" => "secondName",
              "tournamentId" => "1",
              "points" => 0,
              "userId" => "2"
            }
            ]
        }}
        expect(data).to eq(json_client)
      end
    end

    def query
      <<~GQL
        query {
          players(id:"1") {
            id
            userId
            tournamentId
            nickName
            points
          }
        }
      GQL
    end
  end
end