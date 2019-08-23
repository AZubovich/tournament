module Mutations
  class DeleteTournament < BaseMutation
    argument :id, ID, required: true

    type Boolean

    def resolve(id:)
      tour = Tournament.find_by(id: id)
      tour.destroy
      true
    end
  end
end