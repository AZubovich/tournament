require 'rails_helper'
module Mutations
  RSpec.describe UpdateEmail, type: :request do
    describe '.resolve' do

        it 'returns a user' do
          

          post '/graphql', params: { query: update_query }

          json = JSON.parse(response.body)
          data = json['data']['updateEmail']['user']

          expect(data).to include(
            'id'              => "11",
            'email'           => "example@m.ru"
           )
        end
    end

    def update_query
      <<~GQL
        mutation {
          updateEmail(
            email: "example@m.ru"
            token: "vSN6jWcHYjJXPqt05RUd+GhlrTI=--91+2faveMpyasHs0--hm0/65vBpK7Xv4XA/9pWUg=="
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