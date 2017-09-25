class MemberInterest < ApplicationRecord
  belongs_to :member
  belongs_to :interest, class_name: 'Hackroom'
end
