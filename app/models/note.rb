class Note < ApplicationRecord
  belongs_to :member
  has_paper_trail
end
