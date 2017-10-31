class Post < ApplicationRecord
  
  mount_uploader :image, PostImageUploader
  
  belongs_to :user
  has_many :comments
end
