class User < ApplicationRecord
    #Invoke bcrypt to require AND hash passwords
    has_secure_password
    has_many :posts, dependent: :destroy
    validates_uniqueness_of :email
end
