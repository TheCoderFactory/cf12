class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :product_id
      t.string :name
      t.string :one_line
      t.text :content
      t.string :image
      t.boolean :publish
      t.string :gender

      t.timestamps null: false
    end
  end
end
