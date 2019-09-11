module Mutations
  class LaunchTournament < BaseMutation
    argument :id, ID, required: true

    #field :games, [Types::GameType], null: true
    type Boolean

    def resolve(id:)
      tour = Tournament.find_by(id: id)
      if tour.kind == "Regular"
        Tour.create_regular_games(tour)
      end
      if tour.kind == "Play-off"
        Tour.create_playoff_games(tour)
      end
      tour.status = 'active'
      tour.save
    end
  end
end
