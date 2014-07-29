class Group < ActiveRecord::Base
  validates :name, :owner_id, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )

  has_many(
    :group_memberships,
    class_name: "GroupMembership",
    foreign_key: :group_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many :contacts, through: :group_memberships, source: :contact

end