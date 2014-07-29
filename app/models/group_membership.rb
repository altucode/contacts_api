class GroupMembership < ActiveRecord::Base
  validates :owner_id, :group_id, presence: true

end