require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    before(:all) do
      create(:task)
      create(:tournament_with_players)
    end
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all users' do
        #post '/graphql', params: { query: user_tournaments_query }
   
        schema.execute(query: tournament_games_mutation)
        temp = schema.execute(query: player_games_query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "playerGames" => [
            { "id" => "1",
              "status" => "active",
              "tournamentId" => "1"
            },
            { "id" => "2", 
              "status" => "active",
              "tournamentId" => "1"
            }
            ]
        }}
        expect(data).to eq(json_client)
      end
    end

    def player_games_query
      <<~GQL
        query {
          playerGames(
            token: "ddZHjcbrZ3kuzxfTW3U52tLBCg==--Q7WFtkGHdd4mWDt5--uYVJQarMK8TA1dlcKe70YA=="
            tourId: "1"
          ) {
              id
              tournamentId
              status
            }
        }
      GQL
    end
    def tournament_games_mutation
      <<~GQL
        mutation {
          launchTournament(
            id: "1"
          )
        }
      GQL
    end
  end
end