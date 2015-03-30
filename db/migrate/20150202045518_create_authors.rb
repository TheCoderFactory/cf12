class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :profile_picture
      t.string :slug
      t.string :google_plus
      t.string :linkedin
      t.string :twitter
      t.string :github
      t.string :website
      t.string :title
      t.text :info

      t.timestamps null: false
    end
  end
end
