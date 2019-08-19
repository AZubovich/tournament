module Types
  class QueryType < Types::BaseObject

    field :users, resolver: Queries::Users
    field :tournaments, resolver: Queries::Tournaments


    field :profile, UserType, null: true,

    description: 'profile using'

    def profile
      context[:current_user]
    end

    
  end
end
