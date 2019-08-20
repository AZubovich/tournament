module Queries
  class FindTournament < Queries::BaseQuery
    description 'Get necessary query'

    argument :id, ID, required: true
    type Types::TournamentType, null: false

    def resolve(id:)
      ::Tournament.find_by(id: id)
    end
  end
end
