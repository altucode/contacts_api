class User < ActiveRecord::Base
  validates :username, :presence => true, :uniqueness => true

  has_many(
    :contacts,
    class_name: 'Contact',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :contact_shares,
    class_name: 'ContactShare',
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )

  has_many(
    :shared_contacts,
    through: :contact_shares,
    source: :contact
  )

  has_many :comments, as: :commentable, dependent: :destroy

  has_many(
    :authored_comments,
    class_name: "Comment",
    foreign_key: :commenter_id,
    primary_key: :id
  )

  def all_contacts
    contacts + shared_contacts
  end
end