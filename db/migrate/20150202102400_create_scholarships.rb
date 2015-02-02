class CreateScholarships < ActiveRecord::Migration
  def change
    create_table :scholarships do |t|
      t.string :scholarship_type
      t.string :company
      t.string :logo
      t.boolean :available
      t.text :description

      t.timestamps null: false
    end
  end
end
