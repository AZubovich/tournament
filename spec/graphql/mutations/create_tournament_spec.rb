require 'rails_helper'
module Mutations
  RSpec.describe CreateTournament, type: :request do
    abc = BackendSchema
    describe '.resolve' do
      let(:schema) { abc }
      let(:user) { create(:user) }
        it 'creates a tournament' do
          puts "This is user id: #{user.id}"
          expect do
            #post '/graphql', params: { query: query }
            schema.execute(query: query)
          end.to change { Tournament.count }.by(1)
        end

        it 'returns a tournament' do
          puts "This is user id: #{user.id}"
          #post '/graphql', params: { query: second_query }
          temp = schema.execute(query: second_query)
          data = JSON.parse(temp.to_json)
          json_client = { "data" =>
            { "createTournament" => {
              "tournament" => {
                "id" => "2",
                "name" => "name",
                "description" => "description",
                "prize" => 200,
                "kind" => "Regular",
                "limit" => 8,
                "userId" => "2"
              }
            }
          }}
          expect(data).to eq(json_client)

        end
    end

    def query
      <<~GQL
        mutation {
          createTournament(
            title:"Name"
            description:"Description"
            prize:"200"
            kind:"Regular"
            limit:"8"
            token:"BWiRVILcfwEzZd5TqRT848Icfw==--olkrRJ28cCmnnUUJ--ZdRQ72lboTno3Q8Ii0Npgw=="
          ) {
            tournament{
              id
              name
              description
              prize
              kind
              limit
              userId
            }
            }
        }
      GQL
    end
    def second_query
      <<~GQL
        mutation {
          createTournament(
            title:"name"
            description:"description"
            prize:"200"
            kind:"Regular"
            limit:"8"
            token:"ub5H1Ca2j9iYsItSTtqZdEe+uw==--tpoNafysNBDCz1jd--KxvobYq563oFsU14W0etAg=="
          ) {
            tournament{
              id
              name
              description
              prize
              kind
              limit
              userId
            }
            }
        }
      GQL
    end
  end
end