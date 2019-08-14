module Types
  class QueryType < Types::BaseObject
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
  end
end
