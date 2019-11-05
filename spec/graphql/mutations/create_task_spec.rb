require 'rails_helper'
module Mutations
  RSpec.describe CreateTask, type: :request do
    describe '.resolve' do
      let(:schema) { BackendSchema }
        it 'creates a task' do
          expect do
            #post '/graphql', params: { query: query }
            schema.execute(query: first_mutation)
          end.to change { Task.count }.by(1)
        end

        it 'returns a task' do
          #post '/graphql', params: { query: second_query }
          temp = schema.execute(query: second_mutation)
          data = JSON.parse(temp.to_json)
          json_client = { "data" =>
            { "createTask" => {
              "task" => {
                "id" => "2",
                "description" => "Get 300",
                "answer" => '300'
              }
            }
          }}
          expect(data).to eq(json_client)
        end
    end

    def first_mutation
      <<~GQL
        mutation {
          createTask(
            description:"Get 200"
            answer:"200"
          ) {
            task{
              id
              description
              answer
            }
            }
        }
      GQL
    end
    def second_mutation
      <<~GQL
        mutation {
          createTask(
            description:"Get 300"
            answer:"300"
          ) {
            task{
              id
              description
              answer
            }
            }
        }
      GQL
    end
  end
end