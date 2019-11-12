module Queries
  class PlayerTournaments < Queries::BaseQuery
    description 'Get necessary tournaments'

    argument :token, String, required: true
    type [Types::TournamentType], null: true

    def resolve(token:)
      :: Current.current_user(token).tournaments_with_players.where.not(status: "ended").or(Current.current_user(token).tournaments_with_players.where(status: nil)).order(id: :desc)
    end
  end
end
