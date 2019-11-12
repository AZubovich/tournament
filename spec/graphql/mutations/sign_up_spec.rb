require 'rails_helper'
module Mutations
  RSpec.describe SignUp, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
        it 'creates a user' do
          expect do
            schema.execute(query: query, context: { nickname: generate })
          end.to change { User.count }.by(1)
        end

        it 'returns a user' do
          #post '/graphql', params: { query: query }

          temp = schema.execute(query: second_query, context: { nickname: generate })
          data = JSON.parse(temp.to_json)['data']['signUp']['user']

          expect(data).to include(
            'id'              => '2',
            'email'           => 'bobik@m.ru'
          )
        end
    end

    def query
      <<~GQL
        mutation {
          signUp(
            email:"super@m.ru"
            password:"123456"
            passwordConfirmation:"123456"
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

    def second_query
      <<~GQL
        mutation {
          signUp(
            email:"bobik@m.ru"
            password:"123456"
            passwordConfirmation:"123456"
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

    def generate
      gen_name = ([*('a'..'z'),*('0'..'9'),*('A'..'Z')]).sample(6).join
      old_name = User.where(nick_name: gen_name).last
      if old_name.present?
        generate
      else
        gen_name
      end
    end
  end
end
