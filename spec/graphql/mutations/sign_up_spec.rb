require 'rails_helper'
require Mutations::SignUp
RSpec.describe SignUp, type: :request do
      describe '.resolve' do
        it 'signUp a book' do
          user = create(:user)

          expect do
            post '/graphql', params: { query: query }
          end.to change { User.count }.by(1)
        end

        it 'returns a book' do
          author = create(:author)

          post '/graphql', params: { query: query(author_id: author.id) }
          json = JSON.parse(response.body)
          data = json['data']['createBook']

          expect(data).to include(
            'id'              => be_present,
            'title'           => 'Tripwire',
            'publicationDate' => 1999,
            'genre'           => 'Thriller',
            'author'          => { 'id' => author.id.to_s }
          )
        end
      end

      def query
        <<~GQL
          mutation {
            signUp(
              email: "Tripwire"
              password: "123456"
              passwordConfirmation: "123456"
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
