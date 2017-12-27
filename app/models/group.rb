class Group < ApplicationRecord
  belongs_to :user, foreign_key: :created_by
  has_many :messages

  validates_presence_of :group_name, :group_description
  validates :group_name, uniqueness: { case_sensitive: false }, format: {
    with: /\A[a-zA-Z ]{2,}\z/,
    message: "can contain only letters and space " \
             "and be of at least two characters"
  }
  validates :group_description, format: {
    with: /\A[a-zA-Z ]{2,}\z/,
    message: "can contain only letters and space " \
             "and be of at least two characters"
  }
end
