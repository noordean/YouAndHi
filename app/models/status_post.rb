class StatusPost < ApplicationRecord
  belongs_to :user, foreign_key: :posted_by
  has_many :status_comments,
           class_name: "StatusComment",
           foreign_key: "status_post_id"

  validates_presence_of :post
end
