class Profile < ApplicationRecord

    
    belongs_to :user
    has_one_attached :avatar, :dependent => :destroy


    validates :bio, length: { maximum: 1000 }
    validates :status, length: { maximum: 100 }
    
end
