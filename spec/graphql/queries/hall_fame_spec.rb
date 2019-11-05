require 'rails_helper'

module Queries
  RSpec.describe Users, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
      it 'returns all users' do
        create(:user, email: 'first@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'firstName',money: 200)
        create(:user, email: 'second@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'secondName', money: 300)
        create(:user, email: 'third@m.ru', password: '123456', password_confirmation: '123456', nick_name: 'thirdName', money: 100)
        create(:achievement, description: 'You get 1st place', badge_url: 'image1.png', user_id: 1)
        create(:achievement, description: 'You get 2nd place', badge_url: 'image2.png', user_id: 2)
        #post '/graphql', params: { query: query }

        temp = schema.execute(query: query)

        data = JSON.parse(temp.to_json)
        json_client = { 'data' =>
          { 'hallFame' => [
            { 'id' => '2',
              'email' => 'second@m.ru',
              'nickName' => 'secondName',
              'money' => 300,
              'achievements' => [
                {
                  'id' => '2',
                  'userId' => '2',
                  'description' => 'You get 2nd place'
                }
              ]
            },
            { 'id' => '1',
              'email' => 'first@m.ru',
              'nickName' => 'firstName',
              'money' => 200,
              'achievements' => [
                {
                  'id' => '1',
                  'userId' => '1',
                  'description' => 'You get 1st place'
                }
              ]
            }
            ]
        }}
        expect(data).to eq(json_client)

      end
    end

    def query
      <<~GQL
        query {
          hallFame {
            id
            email
            nickName
            money
            achievements{
              id
              userId
              description
            }
          }
        }
      GQL
    end
  end
end

