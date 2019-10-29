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
    field :create_community, mutation: Mutations::CreateCommunity
    field :edit_tournament, mutation: Mutations::EditTournament
    field :delete_tournament, mutation: Mutations::DeleteTournament
    field :launch_tournament, mutation: Mutations::LaunchTournament
    field :register_player, mutation: Mutations::RegisterPlayer
    field :delete_player, mutation: Mutations::DeletePlayer
    field :send_answer, mutation: Mutations::SendAnswer
    field :create_task, mutation: Mutations::CreateTask
    field :add_participant, mutation: Mutations::AddParticipant
    field :delete_participant, mutation: Mutations::DeleteParticipant
  end
end
