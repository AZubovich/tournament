module Queries
  class Players < Queries::BaseQuery
    description 'Get all players from current tournament '
    
    argument :id, ID, required: true

    type [Types::PlayerType], null: true

    def resolve(id:)
      tour = Tournament.find_by(id: id)
      if tour.kind == 'Regular'
        Player.where(tournament_id: id).order(points: :desc, nick_name: :asc)
      else
        Player.where(tournament_id: id)
      end
    end
  end
end
