module Types
  class QueryType < Types::BaseObject

    field :users, resolver: Queries::Users
    field :tournaments, resolver: Queries::Tournaments
    field :find_tournament, resolver: Queries::FindTournament
    field :user_tournaments, resolver: Queries::UserTournaments
    field :player_tournaments, resolver: Queries::PlayerTournaments
    field :players, resolver: Queries::Players
    field :player_games, resolver: Queries::PlayerGames
    field :find_task, resolver: Queries::FindTask
    field :find_user, resolver: Queries::FindUser
    field :hall_fame, resolver: Queries::HallFame
    field :profile, UserType, null: true,

    description: 'profile using'

    def profile
      context[:current_user]
    end

    
  end
end
