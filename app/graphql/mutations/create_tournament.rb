module Mutations
  class CreateTournament < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: false
    argument :prize, String, required: true
    argument :token, String, required: true

    field :tournament, Types::TournamentType, null: true

    def resolve(title:, description:, prize:, token:)
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      tokenize = crypt.decrypt_and_verify token
      user_id = tokenize.gsub('user-id:', '').to_i
      user = User.find_by(id: user_id)
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
