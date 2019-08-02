module Types
  class QueryType < Types::BaseObject
    field :profile, UserType, null: false,
    description: "profile using"

    def profile
      context[:current_user]
    end
  end
end
