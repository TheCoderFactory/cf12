class CreatePositionApplications < ActiveRecord::Migration
  def change
    create_table :position_applications do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :linkedin
      t.string :github
      t.text :experience
      t.text :reason
      t.text :special
      t.string :position

      t.timestamps null: false
    end
  end
end
