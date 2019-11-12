require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    before(:all) do
      create(:task)
      create(:tournament_with_games)
    end
    describe '.resolve' do
      let(:schema) { BackendSchema }
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