module Mutations
  class CreateTournament < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :prize, String, required: true
    argument :kind, String, required: true
    argument :limit, String, required: true
    argument :token, String, required: true
    argument :prizeWinner, String, required: true
    argument :prizeDistribution, String, required: true

    #field :tournament, Types::TournamentType, null: true
    type String

    def resolve(title:, description:, prize:, kind:, limit:, prize_winner:, prize_distribution:, token:)
      user = Current.current_user(token)
      message = ServiceCheck.check_args(prize_distribution, prize_winner, limit, prize)
      if message == 'OK!'
        Tournament.create(
          name: title,
          description: description,
          prize: prize.to_i,
          kind: kind,
          limit: limit.to_i,
          prize_winner: prize_winner.to_i,
          prize_distribution: prize_distribution,
          round: 0,
          user_id: user.id
        )
      end
      message
    end
  end
end
