class User < ApplicationRecord
  has_many :groups,
           class_name: "Group",
           foreign_key: "created_by"
  has_many :messages,
           class_name: "Message",
           foreign_key: "posted_by"
  has_many :group_members,
           class_name: "GroupMember",
           foreign_key: "member"
  has_many :status_posts,
           class_name: "StatusPost",
           foreign_key: "posted_by"
  has_many :status_comments,
           class_name: "StatusComment",
           foreign_key: "commented_by"

  has_secure_password
  validates_presence_of :username, :email, :phone_number
  validates :username, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-zA-Z]{5,15}\z/,
    message: "must contain letters and be between 5-15 characters"
  }
  validates :password, format: {
    with: /\A^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]{5,12}\z/,
    message: "must be alphanumerics and between 5-12 characters"
  }
  validates :email, uniqueness: true, format: {
    with: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/,
    message: "must be valid"
  }
  validates :phone_number, uniqueness: true, format: {
    with: /\A\d{11}\z/,
    message: "must be valid"
  }
end
