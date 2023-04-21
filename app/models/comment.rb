class Comment < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploaders :images, ImageUploader
  # 這是掛載在Comment會需要圖片上傳功能去model掛上去就好
end
