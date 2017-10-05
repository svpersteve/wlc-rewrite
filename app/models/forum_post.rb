class ForumPost < ApplicationRecord
  acts_as_paranoid
  belongs_to :forum_thread
  belongs_to :member
  has_many :forum_post_likes
  has_many :likes, through: :forum_post_likes, source: :member

  validates :body, presence: true

  scope :recent_first, -> { order('created_at desc') }

  def member
    Member.unscoped { super }
  end

  def liked_by(member)
    likes.include? member
  end
end
