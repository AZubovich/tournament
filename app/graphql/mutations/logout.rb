module Mutations
  class Logout < BaseMutation
    type Boolean

    def resolve
      if context[:current_user]
        context[:current_user].destroy
        true
      end
      false
    end
  end
end
