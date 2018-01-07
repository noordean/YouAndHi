class CreateStatusPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :status_posts do |t|
      t.text :post
      t.integer :posted_by

      t.timestamps
    end
  end
end
