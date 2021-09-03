class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :image, :bio, :status

  belongs_to :user
end
