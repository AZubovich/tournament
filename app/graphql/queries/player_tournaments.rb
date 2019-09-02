module Queries
  class PlayerTournaments < Queries::BaseQuery
    description 'Get necessary tournaments'

    argument :token, String, required: true
    type [Types::TournamentType], null: true

    def resolve(token:)
      :: Current.current_user(token).tournaments_with_players
    end
  end
end
