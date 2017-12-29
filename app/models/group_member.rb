class GroupMember < ApplicationRecord
  belongs_to :user, foreign_key: :member
  belongs_to :group

  validates_uniqueness_of :member, scope: :group_id
  validates_presence_of :member, :group_id
end
