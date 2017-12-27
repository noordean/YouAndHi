class AddForeignKeyToMessage < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :messages, :users, column: :posted_by
    add_index :messages, :posted_by
  end
end
