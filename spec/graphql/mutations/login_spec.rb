require 'rails_helper'
module Mutations
  RSpec.describe Login, type: :request do
    abc = GraphQL::BackendSchema
    describe '.resolve' do
      let(:schema) { abc }
      let(:user) { create(:user)}
        it 'invalid inputs has null data' do
          #user = create(:user)
          #post '/graphql', params: { query: invalid_query }

          temp = schema.execute(query: invalid_query)
          data = JSON.parse(temp.to_json)['data']

          expect(data).to equal(nil)
        end
        it 'returns a user' do
          #post '/graphql', params: { query: query }
          puts user.email
          temp = schema.execute(query: query)
          puts temp.to_json
          data = JSON.parse(temp.to_json)['data']['login']['user']
          token_data = JSON.parse(temp.to_json)['data']['login']

          expect(data).to include(
            'id'              => "1",
            'email'           => "example@m.ru"
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
            email:"example@m.ru"
            password:"123456"
          ) {
            user{
              id
              email
            }
            token
            }
        }
      GQL
    end
  end
end