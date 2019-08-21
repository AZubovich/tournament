require 'rails_helper'
module Mutations
  RSpec.describe CreateTournament, type: :request do
    describe '.resolve' do
      let(:user) { create(:user) }
        it 'creates a tournament' do
          puts "This is user id: #{user.id}"
          expect do
            post '/graphql', params: { query: query }
          end.to change { Tournament.count }.by(1)
        end

        it 'returns a tournament' do
          puts "This is user id: #{user.id}"
          post '/graphql', params: { query: second_query }
          json = JSON.parse(response.body)
          data = json['data']['createTournament']['tournament']

          expect(data).to include(
            'id'              => be_present,
            'name'           => 'name',
            'description'    => 'description',
            'prize'           => 200,
            'userId'           => '2'
          )
        end
    end

    def query
      <<~GQL
        mutation {
          createTournament(
            title:"Name"
            description:"Description"
            prize:"200"
            token:"PHrkenltkZYMNEtfwkLtlLIEfg==--xyXYDvTojmYaG7ey--tqgOJI5w25UQ4CtPtuiNWg=="
          ) {
            tournament{
              id
              name
              description
              prize
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
            token:"4AEt+VS5I7wRSZS5LNJ4jo4rZg==--bDBvpHK5T75xP5kp--k1yqJTiDFyhjacQPvgQFwA=="
          ) {
            tournament{
              id
              name
              description
              prize
              userId
            }
            }
        }
      GQL
    end
  end
end