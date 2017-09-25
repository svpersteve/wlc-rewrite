class HackroomLeader < ApplicationRecord
  belongs_to :member
  belongs_to :hackroom
end
