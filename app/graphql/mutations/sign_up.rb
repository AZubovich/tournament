module Mutations
  class SignUp < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true
    argument :passwordConfirmation, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(email:, password:, password_confirmation:)
      nick_name = context[:nickname]
      user = User.create(
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        nick_name: nick_name
      )
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{user.id}")
      context[:session][:token] = token
      { user: user, token: token }
    end
  end
end
