class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :image
      t.string :title
      t.string :link
      t.text :blurb

      t.timestamps null: false
    end
  end
end
