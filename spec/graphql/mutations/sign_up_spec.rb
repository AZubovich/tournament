require 'rails_helper'
module Mutations
  RSpec.describe SignUp, type: :request do
    abc = BackendSchema
    describe '.resolve' do
      let(:schema) { abc }
        it 'creates a user' do
          #user = create(:user)

          expect do
            schema.execute(query: query)
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          #post '/graphql', params: { query: query }

          temp = schema.execute(query: query)
          data = JSON.parse(temp.to_json)['data']['signUp']['user']

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
