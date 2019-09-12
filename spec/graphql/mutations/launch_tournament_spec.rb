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
    end
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      it 'returns all users' do
        #post '/graphql', params: { query: user_tournaments_query }

        temp = schema.execute(query: tournament_games_mutation)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "launchTournament" => true
          }
        }
        expect(data).to eq(json_client)
      end
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