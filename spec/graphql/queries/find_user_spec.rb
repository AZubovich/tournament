require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      it 'returns all users' do
        create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName', money: 100)
        create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName', money: 200)
        create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName', money: 300)
  

        #post '/graphql', params: { query: find_tournaments_query }
        temp = schema.execute(query: find_tournaments_query)
        data = JSON.parse(temp.to_json)
        json_client = { "data" =>
          { "findUser" => { 
              "id" => "1",
              "email" => "first@m.ru",
              "nickName" => "firstName",
              "money" => 100,
            }
        }}
        expect(data).to eq(json_client)
      end
    end

    def find_tournaments_query
      <<~GQL
        query {
          findUser(
          token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              email
              nickName
              money
            }
        }
      GQL
    end
  end
end