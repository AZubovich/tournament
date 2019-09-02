require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      let(:task) { create(:task) }
      it 'returns all users' do
        puts "This is task id: #{task.id}"
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        author1 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')
        author2 = create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName')
        tour1 = create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author.id)
  
        players = create(:player, nick_name: 'firstName', points: 0, user_id: author.id, tournament_id: tour1.id)
        create(:player, nick_name: 'secondName', points: 0, user_id: author1.id, tournament_id: tour1.id)
        create(:player, nick_name: 'thirdName', points: 0, user_id: author2.id, tournament_id: tour1.id)
        #post '/graphql', params: { query: user_tournaments_query }


        temp = schema.execute(query: tournament_games_mutation)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "launchTournament" => 
            { "games" =>[
            { "id" => "1",
              "status" => "active",
              "tournamentId" => "1",
              "firstPlayerId" => 1,
              "secondPlayerId" => 2
            },
            { "id" => "2", 
              "status" => "active",
              "tournamentId" => "1",
              "firstPlayerId" => 1,
              "secondPlayerId" => 3
            },
            { "id" => "3", 
              "status" => "active",
              "tournamentId" => "1",
              "firstPlayerId" => 2,
              "secondPlayerId" => 3
            }
            ]
          }
        }}
        expect(data).to eq(json_client)
      end
    end

    def tournament_games_mutation
      <<~GQL
        mutation {
          launchTournament(
            tourId: "1"
          ) {
              games{
                id
                tournamentId
                status
                firstPlayerId
                secondPlayerId
              }
            }
        }
      GQL
    end
  end
end