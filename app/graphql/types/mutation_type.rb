module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :sign_up, mutation: Mutations::SignUp
    field :logout, mutation: Mutations::Logout
    field :update_email, mutation: Mutations::UpdateEmail
    field :update_name, mutation: Mutations::UpdateName
    field :update_password, mutation: Mutations::UpdatePassword

  end
end
