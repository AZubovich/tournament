module Mutations
  class CreateTournament < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :prize, String, required: true
    argument :token, String, required: true

    field :tournament, Types::TournamentType, null: true

    def resolve(title:, description:, prize:, token:)
      user = Current.current_user(token)
      tournament = Tournament.create(
        name: title,
        description: description,
        prize: prize.to_i,
        user_id: user.id
      )
      { tournament: tournament }

    end
  end
end
