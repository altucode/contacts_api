class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :user_id, presence: true, uniqueness: { scope: :email }

  belongs_to(
    :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id,
  )

  has_many(
    :shares,
    class_name: 'ContactShare',
    foreign_key: :contact_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :shared_users,
    through: :shares,
    source: :user
  )

end