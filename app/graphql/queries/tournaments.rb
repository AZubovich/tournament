module Queries
  class Tournaments < Queries::BaseQuery
    description 'Get all Tournaments'

    type [Types::TournamentType], null: false

    def resolve
      ::Tournament.all
    end
  end
end