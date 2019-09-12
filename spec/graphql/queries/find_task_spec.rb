require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    before(:all) do
      task = create(:task)
      author = create(:user)
      author1 = create(:user)
      tour1 = create(:tournament, user: author)
      player1 = create(:player, user: author, tournament: tour1)
      player2 = create(:player, user: author1, tournament: tour1)
      game1 = create(:game, tournament: tour1, task_id: task.id, first_player_name: player1.nick_name, second_player_name: player2.nick_name)
    end
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      it 'returns all users' do
        #post '/graphql', params: { query: user_tournaments_query }
        temp = schema.execute(query: task_game_query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "findTask" =>
            { "id" => "1",
              "answer" => "MyString",
              "description" => "MyString"
            }          
        }}
        expect(data).to eq(json_client)
      end
    end

    def task_game_query
      <<~GQL
        query {
          findTask(
            id: "1"
          ) {
              id
              description
              answer
            }
        }
      GQL
    end
  end
end