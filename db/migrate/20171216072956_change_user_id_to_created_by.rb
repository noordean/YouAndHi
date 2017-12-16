class ChangeUserIdToCreatedBy < ActiveRecord::Migration[5.1]
  def change
    rename_column :groups, :user_id, :created_by
  end
end
