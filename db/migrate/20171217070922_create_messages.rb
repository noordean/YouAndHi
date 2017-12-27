class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :message_content
      t.integer :posted_by
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
