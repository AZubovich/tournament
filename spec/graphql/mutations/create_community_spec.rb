require 'rails_helper'
module Mutations
  RSpec.describe CreateTournament, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
        it 'creates a community' do
          create(:user)
          expect do
            #post '/graphql', params: { query: query }
            schema.execute(query: query)
          end.to change { Community.count }.by(1)
        end

        it 'returns a message' do
          #post '/graphql', params: { query: second_query }
          create(:user)
          temp = schema.execute(query: second_query)
          data = JSON.parse(temp.to_json)
          json_client = { "data" =>
            { "createCommunity" => "OK!"
            
          }}
          expect(data).to eq(json_client)

        end
    end

    def query
      <<~GQL
        mutation {
          createCommunity(
            title:"Name1"
            description:"Description1"
            limit:"8"
            token:"vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          )
        }
      GQL
    end
    def second_query
      <<~GQL
        mutation {
          createCommunity(
            title:"Name2"
            description:"Description2"
            limit:"8"
            token:"ub5H1Ca2j9iYsItSTtqZdEe+uw==--tpoNafysNBDCz1jd--KxvobYq563oFsU14W0etAg=="
          )
        }
      GQL
    end
  end
end