require 'rails_helper'
module Mutations
  RSpec.describe CreateTournament, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
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
            { "createTournament" => "OK!"
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
            prizeWinner:"2"
            prizeDistribution:"150,50"
          ) 
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
            prizeWinner:"2"
            prizeDistribution:"150,50"
          )
        }
      GQL
    end
  end
end