module Mutations
  class EditTournament < BaseMutation
    argument :name, String, required: false
    argument :description, String, required: false
    argument :prize, String, required: false
    argument :id, ID, required: true

    field :tournament, Types::TournamentType, null: true

    def resolve(name:, description:, prize:, id:)
      tour = Tournament.find_by(id: id)
      tour.update(
        name: name,
        description: description,
        prize: prize.to_i
      )
      { tournament: tour }
    end
  end
end