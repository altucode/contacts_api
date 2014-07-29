class GroupMembership < ActiveRecord::Base
  validates :contact_id, :group_id, presence: true

  belongs_to(
    :group,
    class_name: "Group",
    foreign_key: :group_id,
    primary_key: :id
  )

  belongs_to(
    :contact,
    class_name: "Contact",
    foreign_key: :contact_id,
    primary_key: :id
  )

end