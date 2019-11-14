require 'rails_helper'
module Mutations
  RSpec.describe DeletePlayer, type: :request do
    describe '.resolve' do
        let(:tournament) { create(:tournament) }
        let(:schema) { BackendSchema }
        it 'deletes a player' do
          author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
          puts "This is author_id: #{author.id}"
          puts "This tour id:#{tournament.id}"
          schema.execute(query: query)

          expect(Player.find_by(id: "1")).not_to eq(nil)
          #post '/graphql', params: { query: delete_query }
          schema.execute(query: delete_query)
          expect(Player.find_by(id: "1")).to eq(nil)
        end
    end

    def delete_query
      <<~GQL
        mutation {
          deletePlayer(
            token:"BBvAFIdv3LcCy5yBUgo+qkSa2A==--Dz1N+hQh9lHy4yTp--HUuzauY9BH+WBXK/22eZRw=="
            tourId:"1"
          )
        }
      GQL
    end

    def query
      <<~GQL
        mutation {
          registerPlayer(
            token:"BBvAFIdv3LcCy5yBUgo+qkSa2A==--Dz1N+hQh9lHy4yTp--HUuzauY9BH+WBXK/22eZRw=="
            tourId:"1"
            money:"300"
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