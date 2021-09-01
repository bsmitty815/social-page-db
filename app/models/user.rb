class User < ApplicationRecord
    has_secure_password
    has_one :profile, dependent: :destroy

    validates :username, presence: true, uniqueness: true



    
end
