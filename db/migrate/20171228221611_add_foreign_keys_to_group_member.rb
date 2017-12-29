class AddForeignKeysToGroupMember < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :group_members, :users, column: :member
    add_foreign_key :group_members, :groups, column: :group_id
  end
end
