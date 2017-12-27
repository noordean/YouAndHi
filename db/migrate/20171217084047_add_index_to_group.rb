class AddIndexToGroup < ActiveRecord::Migration[5.1]
  def change
    add_index :groups, :created_by
  end
end
