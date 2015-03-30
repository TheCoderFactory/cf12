class AddPostCategoryToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :post_category, index: true
    add_foreign_key :posts, :post_categories
  end
end
