require 'rails_helper'
module Mutations
  RSpec.describe DeleteTournament, type: :request do
    describe '.resolve' do
        let(:user) { create(:user) }
        let(:tournament) { create(:tournament) }
        let(:schema) { BackendSchema }
        it 'deletes a  tournament' do
          tournament.reload
          expect(Tournament.find_by(id: "1")).not_to eq(nil)
          #post '/graphql', params: { query: delete_query }
          schema.execute(query: delete_query)
          expect(Tournament.find_by(id: "1")).to eq(nil)
        end
    end

    def delete_query
      <<~GQL
        mutation {
          deleteTournament(
            id:"1"
          )
        }
      GQL
    end
  end
end