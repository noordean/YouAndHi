class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user, foreign_key: :posted_by

  validates_presence_of :message_content
end
