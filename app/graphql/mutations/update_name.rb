module Mutations
  class UpdateName < BaseMutation
    argument :nick_name, String, required: true
    argument :token, String, required: true
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:, token:)
      #user = context[:current_user]
      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.credentials.secret_key_base.byteslice(0..31))
      tokenize = crypt.decrypt_and_verify token
      user_id = tokenize.gsub('user-id:', '').to_i
      user = User.find_by(id: user_id)
      user.update(
        nick_name: nick_name
      )
      { user: user }
    end
  end
end

