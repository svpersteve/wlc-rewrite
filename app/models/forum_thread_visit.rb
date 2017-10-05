class ForumThreadVisit < ApplicationRecord
  belongs_to :member
  belongs_to :forum_thread
end
