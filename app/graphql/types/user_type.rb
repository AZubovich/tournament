module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :email, String, null: true
    field :nick_name, String, null: true
    field :admin, Boolean, null: true
    field :super_admin, Boolean, null: true
  end
end
