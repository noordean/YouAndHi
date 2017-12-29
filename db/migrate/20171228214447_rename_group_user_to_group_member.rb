class RenameGroupUserToGroupMember < ActiveRecord::Migration[5.1]
  def change
    rename_table :group_users, :group_members
  end
end
