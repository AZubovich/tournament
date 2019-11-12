module Queries
  class FindParticipants < Queries::BaseQuery
    description 'Get all participants of community'

    argument :token, String, required: true
    type [Types::UserType], null: false

    def resolve(token:)
      user = Current.current_user(token)
      User.where(community_id: user.community_id)
    end
  end
end
