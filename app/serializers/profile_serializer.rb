class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :image, :bio, :status

  belongs_to :user
end
