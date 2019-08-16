require 'rails_helper'
module Mutations
  RSpec.describe UpdateEmail, type: :request do
    describe '.resolve' do

        it 'returns a user' do
          

          post '/graphql', params: { query: update_query }

          json = JSON.parse(response.body)
          data = json['data']['updateName']['user']

          expect(data).to include(
            'id'              => "11",
            'email'           => "expl@m.ru",
            'nickName'        => "anotherName"
           )
        end
    end


    def update_query
      <<~GQL
        mutation {
          updateName(
            nickName: "anotherName"
            token: "vSN6jWcHYjJXPqt05RUd+GhlrTI=--91+2faveMpyasHs0--hm0/65vBpK7Xv4XA/9pWUg=="
          ) {
            user{
              id
              email
              nickName
            }
            }
        }
      GQL
    end
  end
end