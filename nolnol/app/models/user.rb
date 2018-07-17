class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_messageable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, S3Uploader
  def mailboxer_name
    self.user_name
  end

  def mailboxer_email(object)
    self.email
  end
  validates :user_name, presence: true, uniqueness: false
  # 관계 이름 : follower_relations(다른 이름으로 변경 가능)
  # 외래키 : followed_id
  # 모델명 : Follow
  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  # 관계 이름 : followers (다른 이름으로 변경 가능)
  # follow_relations를 통해 가져올 값 : follower ( follow.follower )
  has_many :followers, through: :follower_relations, source: :follower

  has_many :follower_relations, foreign_key: "followed_id", class_name: "Follow"
  has_many :followers, through: :follower_relations, source: :follower

  has_many :following_relations, foreign_key: "follower_id", class_name: "Follow"
  has_many :followings, through: :following_relations, source: :followed
end
