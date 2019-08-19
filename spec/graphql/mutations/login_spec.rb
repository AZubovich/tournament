require 'rails_helper'
module Mutations
  RSpec.describe Login, type: :request do
    describe '.resolve' do
        it 'invalid inputs has null data' do
          #user = create(:user)
          post '/graphql', params: { query: invalid_query }
          
          json = JSON.parse(response.body)
          data = json['data']
          expect(data).to equal(nil)
        end

        it 'returns a user' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['login']['user']
          token_data = json['data']['login']

          expect(data).to include(
            'id'              => "11",
            'email'           => "expl@m.ru"
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
            email:"expl@m.ru"
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