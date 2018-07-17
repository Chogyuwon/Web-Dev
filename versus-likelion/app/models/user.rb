class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :post_likes
    has_many :comment_likes
    has_many :votes
    has_many :speakers
end
