module Mutations
  class DeleteParticipant < BaseMutation
    argument :nick_name, String, required: true
    argument :token, String, required: true
    field :user, Types::UserType, null: true
    #type Types::UserType
    
    def resolve(nick_name:, token:)
      user = User.find_by(nick_name: nick_name)
      admin = Current.current_user(token)
      community = Community.find_by(creator: admin.nick_name)
      user.update(community_id: nil) unless user.community_id.nil? && user.community_id == community.id
      { user: user }
    end
  end
end
