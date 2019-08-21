require 'rails_helper'

module Queries
  RSpec.describe Tournaments, type: :request do
    describe '.resolve' do
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')

        tours = create(:tournament, name: 'First', description: 'First description', prize: 200, user_id: author.id)
        create(:tournament, name: 'Second', description: 'Second description', prize: 300, user_id: author.id)
  

        post '/graphql', params: { query: query }

        json = JSON.parse(response.body)
        data = json['data']['tournaments']

        expect(data).to match_array [
          hash_including(
            'id'          => be_present,
            'name'   => 'First',
            'description'    => 'First description',
            'prize'    => 200,
            'userId'    => '1'

          ),
          hash_including(
            'id'          => be_present,
            'name'   => 'Second',
            'description'    => 'Second description',
            'prize'    => 300,
            'userId'    => '1'
          )
        ]
      end
    end

    def query
      <<~GQL
        query {
          tournaments {
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