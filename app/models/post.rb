class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image_uri

    def thumbnail
       return self.image_uri.variant(resize: '750x750!')
    end 
end
