require 'rails_helper'

module Queries
  RSpec.describe Users, type: :request do
    describe '.resolve' do
      let(:schema) { GraphQL::BackendSchema }
      it 'returns all users' do
        author = create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
        create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName')

        #post '/graphql', params: { query: query }

        temp = schema.execute(query: query)
        data = JSON.parse(temp.to_json)['data']['users']


        expect(data).to match_array [
          hash_including(
            'id'          => be_present,
            'email'   => 'first@m.ru',
            'nickName'    => 'firstName'
          ),
          hash_including(
            'id'          => be_present,
            'email'   => 'second@m.ru',
            'nickName'    => 'secondName'
          )
        ]
      end
    end

    def query
      <<~GQL
        query {
          users {
            id
            email
            nickName
          }
        }
      GQL
    end
  end
end