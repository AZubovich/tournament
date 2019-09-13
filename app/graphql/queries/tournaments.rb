module Queries
  class Tournaments < Queries::BaseQuery
    description 'Get all Tournaments'

    type [Types::TournamentType], null: false

    def resolve
      ::Tournament.all.order(status: :desc, prize: :desc)
    end
  end
end
