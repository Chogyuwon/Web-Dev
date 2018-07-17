class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :board_image, S3Uploader
end
