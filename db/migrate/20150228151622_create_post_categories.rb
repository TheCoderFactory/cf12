class CreatePostCategories < ActiveRecord::Migration
  def change
    create_table :post_categories do |t|
      t.string :name
      t.text :description
      t.string :icon

      t.timestamps null: false
    end
  end
end
