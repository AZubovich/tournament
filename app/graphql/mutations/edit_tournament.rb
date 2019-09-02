module Mutations
  class EditTournament < BaseMutation
    argument :name, String, required: false
    argument :description, String, required: false
    argument :prize, String, required: false
    argument :kind, String, required: true
    argument :limit, String, required: true
    argument :id, ID, required: true

    field :tournament, Types::TournamentType, null: true

    def resolve(name:, description:, prize:, kind:, limit:, id:)
      tour = Tournament.find_by(id: id)
      tour.update(
        name: name,
        description: description,
        prize: prize.to_i,
        kind: kind,
        limit: limit
      )
      { tournament: tour }
    end
  end
end