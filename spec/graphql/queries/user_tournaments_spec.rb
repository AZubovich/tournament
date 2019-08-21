require 'rails_helper'
module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        author1 = create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')
        tours = create(:tournament, name: 'First', description: 'First description', prize: 200, user_id: author.id)
        create(:tournament, name: 'Second', description: 'Second description', prize: 300, user_id: author1.id)
  

        post '/graphql', params: { query: user_tournaments_query }

        json = JSON.parse(response.body)
        data = json['data']['userTournaments']
        expect(data).to include(
            'id'          => be_present,
            'name'   => 'First',
            'description'    => 'First description',
            'prize'    => 200,
            'userId'    => '1'
          )
      end
    end

    def user_tournaments_query
      <<~GQL
        query {
          userTournaments(
            token: "vZX+tfA6rJbo2J8yG6OcrFuGGw==--U2l6JDjLX7SUiR7i--+X6oILQ8a+WzLKDDt3LaiA=="
          ) {
              id
              name
              description
              prize
              userId
            }
        }
      GQL
    end
  end
end