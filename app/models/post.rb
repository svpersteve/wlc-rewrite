class Post < ApplicationRecord
  belongs_to :author, class_name: 'Member'

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  # scope :published, -> { where(published_at: !nil) }
end
