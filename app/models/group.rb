class Group < ApplicationRecord
  validates_presence_of :group_name, :group_description
  validates :group_name, uniqueness: true, format: {
    with: /\A[a-zA-Z ]{2,}\z/,
    message: "can contain only letters and space and be of at least two characters"
  }
  validates :group_description, format: {
    with: /\A[a-zA-Z ]{2,}\z/,
    message: "can contain only letters and space and be of at least two characters"
  }
end
