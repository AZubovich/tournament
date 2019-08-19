require 'rails_helper'
module Mutations
  RSpec.describe SignUp, type: :request do
    describe '.resolve' do
        it 'creates a user' do
          #user = create(:user)

          expect do
            post '/graphql', params: { query: query }
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body)
          data = json['data']['signUp']['user']

          expect(data).to include(
            'id'              => be_present,
            'email'           => 'expl@m.ru'
          )
        end
    end

    def query
      <<~GQL
        mutation {
          signUp(
            email:"expl@m.ru"
            password:"123456"
            passwordConfirmation:"123456"
          ) {
            user{
              id
              email
            }
            }
        }
      GQL
    end
  end
end
