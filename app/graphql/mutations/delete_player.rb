module Mutations
  class DeletePlayer < BaseMutation
    argument :token, String, required: true
    argument :tour_id, ID, required: true

    type Boolean

    def resolve(token:, tour_id:)
      user = Current.current_user(token)
      tour = Tournament.find_by(id: tour_id)
      Player.find_by(user_id: user.id, tournament_id: tour.id).destroy
      true
    end
  end
end