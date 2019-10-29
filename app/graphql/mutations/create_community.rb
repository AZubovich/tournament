module Mutations
  class CreateCommunity < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :limit, String, required: true
    argument :token, String, required: true

    #field :tournament, Types::TournamentType, null: true
    type String

    def resolve(title:, description:, limit:, token:)
      user = Current.current_user(token)
      message = 'You already have a community'
      if user.community_id.nil?
        community = Community.create(
          title: title,
          description: description,
          limit: limit.to_i,
          creator: user.nick_name
        )
        user.update(community_id: community.id.to_i)
        message = 'OK!'
      end
      message
    end
  end
end
