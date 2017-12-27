class AddCreatedByToGroup < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :groups, :users, column: :created_by
  end
end
