require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    before(:all) do
      task = create(:task)
      author = create(:user)
      author1 = create(:user)
      author2 = create(:user)
      tour1 = create(:tournament, user: author)
      player1 = create(:player, user: author, tournament: tour1)
      player2 = create(:player, user: author1, tournament: tour1)
      player3 = create(:player, user: author2, tournament: tour1)
      #game1 = create(:game, tournament: tour1, task_id: task.id, first_player_name: player1.nick_name, second_player_name: player2.nick_name)
    end
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
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
            token: "BWiRVILcfwEzZd5TqRT848Icfw==--olkrRJ28cCmnnUUJ--ZdRQ72lboTno3Q8Ii0Npgw=="
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