class AddAuthorToPost < ActiveRecord::Migration
  def change
  	# remove_reference :posts, :author, index: true
  	# remove_foreign_key :posts, :authors
    add_reference :posts, :author, index: true
    add_foreign_key :posts, :authors
  end
end
