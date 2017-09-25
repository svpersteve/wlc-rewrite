class Hackroom < ApplicationRecord
  has_many :hackroom_leaders
  has_many :leaders, through: :hackroom_leaders, source: :member
  has_many :member_interests, foreign_key: :interest_id
  has_many :interested_members, through: :member_interests, source: :member

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
