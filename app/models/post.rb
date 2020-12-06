class Post < ApplicationRecord
    belongs_to :user
    validates :comment, presence: true, length: { maximum: 255 }
    mount_uploader :img ,ImgUploader
    validates :img,presence: true
end
