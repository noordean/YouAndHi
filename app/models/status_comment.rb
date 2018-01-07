class StatusComment < ApplicationRecord
  belongs_to :status_post
  belongs_to :user, foreign_key: :commented_by

  validates_presence_of :comment
end
