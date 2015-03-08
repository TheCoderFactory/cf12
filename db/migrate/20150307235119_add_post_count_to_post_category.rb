class AddPostCountToPostCategory < ActiveRecord::Migration
  def change
    add_column :post_categories, :post_count, :integer
  end
end
