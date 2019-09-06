module Mutations
  class CreateTournament < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :prize, String, required: true
    argument :kind, String, required: true
    argument :limit, String, required: true
    argument :token, String, required: true

    field :tournament, Types::TournamentType, null: true

    def resolve(title:, description:, prize:, kind:, limit:, token:)
      user = Current.current_user(token)
      tournament = Tournament.create(
        name: title,
        description: description,
        prize: prize.to_i,
        kind: kind,
        limit: limit.to_i,
        round: 0,
        user_id: user.id
      )
      { tournament: tournament }

    end
  end
end
