class AddForeignKeysToGroupUser < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :group_users, :users, column: :user_id
    add_foreign_key :group_users, :groups, column: :group_id
  end
end
