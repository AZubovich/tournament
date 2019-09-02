module Types
  class MutationType < Types::BaseObject
    field :login, mutation: Mutations::Login
    field :sign_up, mutation: Mutations::SignUp
    field :logout, mutation: Mutations::Logout
    field :update_email, mutation: Mutations::UpdateEmail
    field :update_name, mutation: Mutations::UpdateName
    field :update_password, mutation: Mutations::UpdatePassword
    field :update_admin, mutation: Mutations::UpdateAdmin
    field :create_tournament, mutation: Mutations::CreateTournament
    field :edit_tournament, mutation: Mutations::EditTournament
    field :delete_tournament, mutation: Mutations::DeleteTournament
    field :register_player, mutation: Mutations::RegisterPlayer
    field :delete_player, mutation: Mutations::DeletePlayer
  end
end
