require 'rails_helper'
module Mutations
  RSpec.describe EditTournament, type: :request do
    describe '.resolve' do
        let(:user) { create(:user) }
        let(:tournament) { create(:tournament) }
        it 'returns a edits tournament' do
          tournament.reload
          post '/graphql', params: { query: edit_query }
          tournament.reload
          expect(tournament.name).to eq("Name")
          expect(tournament.description).to eq("Description")
          expect(tournament.prize).to eq(100)
        end
    end

    def edit_query
      <<~GQL
        mutation {
          editTournament(
            name: "Name"
            description: "Description"
            prize: "100"
            id:"1"
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
