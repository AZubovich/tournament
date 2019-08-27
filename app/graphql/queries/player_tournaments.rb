module Queries
  class PlayerTournaments < Queries::BaseQuery
    description 'Get necessary tournaments'

    argument :token, String, required: true
    type [Types::TournamentType], null: true

    def resolve(token:)
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      tokenize = crypt.decrypt_and_verify token
      user_id = tokenize.gsub('user-id:', '').to_i
      puts "This is user_id: #{user_id}"
      :: Current.current_user(token).tournaments_with_players
    end
  end
end