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

        game1 = create(:game, task_id: 1)
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