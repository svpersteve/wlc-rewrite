class ForumThread < ApplicationRecord
  acts_as_paranoid

  belongs_to :member
  has_many :forum_posts, dependent: :destroy
  has_many :users, through: :forum_posts
  has_many :forum_thread_visits
  has_many :visits, through: :forum_thread_visits, source: :member

  extend FriendlyId
  friendly_id :subject, use: [:slugged, :finders]

  accepts_nested_attributes_for :forum_posts

  validates :subject, presence: true
  validates_associated :forum_posts

  def participants
    members = []
    forum_posts.recent_first.map { |fp| members << fp.member }
    members.uniq
  end

  def participant_count
    participants.uniq.count
  end
end
