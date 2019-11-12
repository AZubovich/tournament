module Queries
  class HallFame < Queries::BaseQuery
    description 'Get the best players'

    type [Types::UserType], null: false

    def resolve
      ::User.hall_of_fame
    end
  end
end
