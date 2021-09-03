class UsersSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest

  has_one :profile
end
