class User < ApplicationRecord
    #Invoke bcrypt to require AND hash passwords
    has_secure_password
    #If User is deleted, its posts are deleted as well
    has_many :posts, dependent: :destroy
    #Checks if email already exists in database so no duplicate emails can be created... need to figure out how to send error
    validates_uniqueness_of :email
end
