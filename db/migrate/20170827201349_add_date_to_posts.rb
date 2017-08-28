class AddDateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :date, :date

      Post.find_each do |post|
        post.date = post.created_at.to_date
        post.save( :validate => false )
      end
  end
end
