class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :comments, :status
     add_index :comments, :post_id
     add_index :likes, :post_id
     add_index :likes, :user_id

     add_index :subscriptions, :post_id
     add_index :subscriptions, :user_id
  end
end
