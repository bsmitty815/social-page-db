class ProfileSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :user_id, :image, :bio, :status, :avatar

  belongs_to :user


  def avatar
    return unless object.avatar.attached?

    object.avatar.blob.attributes
          .slice('filename', 'byte_size')
          .merge(url: avatar_url)
          .tap { |attrs| attrs['name'] = attrs.delete('filename') }
  end

  def avatar_url
    url_for(object.avatar)
  end

end
