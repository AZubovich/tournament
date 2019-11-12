require 'rails_helper'
module Mutations
  RSpec.describe EditTournament, type: :request do
    describe '.resolve' do
        let(:user) { create(:user) }
        let(:tournament) { create(:tournament) }
        let(:schema) { BackendSchema }
        it 'returns a edits tournament' do
          tournament.reload
          schema.execute(query: edit_query)
          tournament.reload
          expect(tournament.name).to eq("Name")
          expect(tournament.description).to eq("Description")
          expect(tournament.prize).to eq(100)
          expect(tournament.kind).to eq("Play-off")
          expect(tournament.limit).to eq(4)
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
            kind:"Play-off"
            limit:"4"
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
