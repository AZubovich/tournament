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
        temp = schema.execute(query: first_send_mutation)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "sendAnswer" => "Sorry, you have a mistake"
        }}
        expect(data).to eq(json_client)
      end
    end

    def first_send_mutation
      <<~GQL
        mutation {
          sendAnswer(
            token:"vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
            id:"1"
            answer:"5"
            timer:1567683860236
          )
        }
      GQL
    end
  end
end