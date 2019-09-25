module Queries
  class UserTournaments < Queries::BaseQuery
    description 'Get necessary tournaments'

    argument :token, String, required: true
    type [Types::TournamentType], null: true

    def resolve(token:)
      user = Current.current_user(token)
      ::Tournament.where(user_id: user.id).order(status: :desc, prize: :desc)
    end
  end
end
