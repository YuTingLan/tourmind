class Comment < ApplicationRecord
    mount_uploader :image, ImageUploader
    mount_uploaders :images, ImageUploader
end
