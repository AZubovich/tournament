module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :sign_up, mutation: Mutations::SignUp
    field :logout, mutation: Mutations::Logout
    field :simple, mutation: Mutations::Simple


    field :github, UserType, null: true do
      description 'registrate with GitHub'
    end

    def github
      User.from_omniauth(context[:request].env['omniauth.auth'])
    end
  end
end
