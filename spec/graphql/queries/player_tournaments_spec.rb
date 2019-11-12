require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        tour1 = create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author.id)
        tour2 = create(:tournament, name: 'Second', description: 'Second description', prize: 300, kind: 'Play-off', limit: 4, user_id: author.id)
  
        create(:player, nick_name: 'firstName', points: 0, user_id: author.id, tournament_id: tour1.id)
        create(:player, nick_name: 'secondName', points: 0, user_id: author.id, tournament_id: tour2.id)
        #post '/graphql', params: { query: user_tournaments_query }


        temp = schema.execute(query: player_tournaments_query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "playerTournaments" => [
            { "id" => "2", 
              "name" => "Second",
              "description" => "Second description",
              "prize" => 300,
              "kind" => "Play-off",
              "limit" => 4,
              "userId" => "1",
              "players" => [
                { "id" => "2",
                  "userId" => "1",
                  "tournamentId" => "2",
                  "nickName"  => "secondName",
                  "points"   =>  0
                }
                ]
            },
            { "id" => "1",
              "name" => "First",
              "description" => "First description",
              "prize" => 200,
              "kind" => "Regular",
              "limit" => 8,
              "userId" =>"1",
              "players" => [
                { "id" => "1",
                  "userId" => "1",
                  "tournamentId" => "1",
                  "nickName" => "firstName",
                  "points" => 0 
                }
                ]
            }            
            ]
        }}
        expect(data).to eq(json_client)
      end
    end

    def player_tournaments_query
      <<~GQL
        query {
          playerTournaments(
            token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              name
              description
              prize
              kind
              limit
              userId
              players{
                id
                userId
                tournamentId
                nickName
                points
              }
            }
        }
      GQL
    end
  end
end


