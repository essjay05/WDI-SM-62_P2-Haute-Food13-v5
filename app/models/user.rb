class User < ApplicationRecord
    #Invoke bcrypt to require AND hash passwords
    has_secure_password
    has_many :posts, dependent: :destroy
end
