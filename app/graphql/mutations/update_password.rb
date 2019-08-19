module Mutations
  class UpdatePassword < BaseMutation
    argument :password, String, required: true
    argument :passwordConfirmation, String, required: true
    argument :token, String, required: true
    #type Types::UserType
    field :user, Types::UserType, null: true

    def resolve(password:, password_confirmation:, token:)
      #user = context[:current_user]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      tokenize = crypt.decrypt_and_verify token
      user_id = tokenize.gsub('user-id:', '').to_i
      user = User.find_by(id: user_id)
      user.update(
        password: password,
        password_confirmation: password_confirmation
      )
      { user: user }
    end
  end
end
