module Queries
  class FindUser < Queries::BaseQuery
    description 'Get necessary user'

    argument :token, String, required: true
    type Types::UserType, null: false

    def resolve(token:)
      ::Current.current_user(token)
    end
  end
end
