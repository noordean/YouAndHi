class CreateStatusComments < ActiveRecord::Migration[5.1]
  def change
    create_table :status_comments do |t|
      t.text :comment
      t.integer :commented_by
      t.references :status_post, foreign_key: true

      t.timestamps
    end
  end
end
