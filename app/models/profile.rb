class Profile < ApplicationRecord

    belongs_to :user

    validates :bio, length: { maximum: 1000 }
    validates :status, length: { maximum: 100 }
    
end
