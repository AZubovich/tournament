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
        tour1 = create(:tournament, name: 'First', description: 'First description', prize: 200, kind: 'Regular', limit: 8, user_id: author.id)
  
        players = create(:player, nick_name: 'firstName', points: 0, user_id: author.id, tournament_id: tour1.id)
        create(:player, nick_name: 'secondName', points: 0, user_id: author1.id, tournament_id: tour1.id)

        game1 = create(:game, task_id: 1, tournament_id: tour1.id, status: 'active', first_player_id: nil, second_player_id: nil,
        first_player_name: author.nick_name, second_player_name: author1.nick_name, first_player_time: 0, second_player_time: 0)
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