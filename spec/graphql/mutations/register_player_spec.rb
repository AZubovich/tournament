require 'rails_helper'
module Mutations
  RSpec.describe RegisterPlayer, type: :request do
    abc = BackendSchema
    describe '.resolve' do
      let(:schema) { abc }
      let(:user) { create(:user) }
      let(:tournament) { create(:tournament) }
        it 'creates a player' do
          author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
          puts "This is author_id: #{author.id}"
          puts "This is tour id: #{tournament.id}"
          expect do
            #post '/graphql', params: { query: query }
            schema.execute(query: query)
          end.to change { Player.count }.by(1)
        end

        it 'returns a tournament' do
          author1 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')
          puts "This is user id: #{author1.id}"
          puts "#{tournament.id}"
          #post '/graphql', params: { query: second_query }
          temp = schema.execute(query: second_query)

          data = JSON.parse(temp.to_json)
          json_client = { "data" =>
            { "registerPlayer" => {
              "player" => {
                "id" => "2",
                "nickName" => "secondName",
                "tournamentId" => "2",
                "points" => 0,
                "userId" => "3"
              }
            }
          }}
          expect(data).to eq(json_client)
        end
    end

    def query
      <<~GQL
        mutation {
          registerPlayer(
            token:"BBvAFIdv3LcCy5yBUgo+qkSa2A==--Dz1N+hQh9lHy4yTp--HUuzauY9BH+WBXK/22eZRw=="
            tourId:"1"
          ) {
            player{
              id
              userId
              tournamentId
              nickName
              points
            }
            }
        }
      GQL
    end
    def second_query
      <<~GQL
        mutation {
          registerPlayer(
            token:"OA5UZiSrOF4EgBEnHILn/JTcVg==--uQ1qQCPkrojRAxgM--YHkvBJvJ+G1CEjJRIC9zxg=="
            tourId:"2"
          ) {
            player{
              id
              userId
              tournamentId
              nickName
              points
            }
        }
      }
      GQL
    end
  end
end