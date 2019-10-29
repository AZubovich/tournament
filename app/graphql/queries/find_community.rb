module Queries
  class FindCommunity < Queries::BaseQuery
    description 'Get necessary community'

    argument :token, String, required: true
    type Types::CommunityType, null: false

    def resolve(token:)
      user = Current.current_user(token)
      Community.find_by(id: user.community_id)
    end
  end
end
