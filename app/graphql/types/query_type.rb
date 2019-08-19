module Types
  class QueryType < Types::BaseObject

     field :users, resolver: Queries::Users



    field :profile, UserType, null: true,

    description: 'profile using'

    def profile
      context[:current_user]
    end

    field :users, [UserType], null: true do
      description 'Get all Users'
    end

    def users
      User.all
    end

    field :first, UserType, null: false,
    description: 'fetch first user'

    def first
      User.first
    end
  end
end
