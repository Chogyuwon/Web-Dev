class Post < ApplicationRecord
  mount_uploader :image_1 , S3Uploader
  mount_uploader :image_2 , S3Uploader
  mount_uploader :image_3 , S3Uploader
  # serialize :image, JSON
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :post_likes, :dependent => :destroy
  has_many :votes, :dependent => :destroy
  has_many :speakers, :dependent => :destroy
end
