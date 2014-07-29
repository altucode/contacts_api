class Group < ActiveRecord::Base
  validates :name, :owner_id, presence: true

  belongs_to(
    :owner,
    class_name: "User",
    foreign_key: :owner_id,
    primary_key: :id
  )

end