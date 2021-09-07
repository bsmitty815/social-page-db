class User < ApplicationRecord
    
    has_one :profile, dependent: :destroy

    has_secure_password

    validates :username, presence: true, uniqueness: true

    #create profile after user is created
    # after_create do
    #     create_profile(:user_id => self.id)
    # end

    after_create do
      create_profile(:user_id => self.id, :bio => "", :status => "", :image => "")
    end



    
end
