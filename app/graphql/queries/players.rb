module Queries
  class Players < Queries::BaseQuery
    description 'Get all players from current tournament '
    
    argument :id, ID, required: true

    type [Types::PlayerType], null: true

    def resolve(id:)
      tour = Tournament.find_by(id: id)
      if tour.kind == 'Regular'
        Player.regular_order(id)
      else
        Player.playoff_order(id)
      end
    end
  end
end
