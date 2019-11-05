require 'rails_helper'
module Mutations
  RSpec.describe Login, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
        it 'invalid inputs has null data' do
          #user = create(:user)
          #post '/graphql', params: { query: invalid_query }

          temp = schema.execute(query: invalid_query)
          data = JSON.parse(temp.to_json)['data']

          expect(data).to equal(nil)
        end
        it 'returns a user' do
          #post '/graphql', params: { query: query }
          create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName')
          temp = schema.execute(query: query)
          data = JSON.parse(temp.to_json)['data']['login']['user']
          token_data = JSON.parse(temp.to_json)['data']['login']

          expect(data).to include(
            'id'              => '1',
            'email'           => 'first@m.ru',
            'nickName'        => 'firstName'
          )
          expect(token_data).to include(
            'token'              => be_present
          )
        end
    end
    def invalid_query
      <<~GQL
        mutation {
          login(
            email:"expl"
            password:"1234"
          ) {
            user{
              id
              email
              nickName
            }
            token
            }
        }
      GQL
    end
    def query
      <<~GQL
        mutation {
          login(
            email:"first@m.ru"
            password:"123456"
          ) {
            user{
              id
              email
              nickName
            }
            token
            }
        }
      GQL
    end
  end
end

