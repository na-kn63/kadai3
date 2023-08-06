class Book < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  
  has_one_attached :profile_image

  
 def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    pirofile_image.variant(resize_to_limit: [width, height]).processed
 end
 end
