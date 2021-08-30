class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true, uniqueness: true

    has_one :profile
end
