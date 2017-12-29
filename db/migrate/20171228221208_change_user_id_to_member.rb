class ChangeUserIdToMember < ActiveRecord::Migration[5.1]
  def change
    rename_column :group_members, :user_id, :member
  end
end
