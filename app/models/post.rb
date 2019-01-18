class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image_uri

    def thumbnail
       return self.image_uri.variant(resize: '300x300!')
    end 
end
