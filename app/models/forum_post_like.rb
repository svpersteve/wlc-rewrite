class ForumPostLike < ApplicationRecord
  belongs_to :member
  belongs_to :forum_post
end
