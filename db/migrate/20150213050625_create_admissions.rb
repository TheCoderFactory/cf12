class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.references :fast_track_application, index: true
      t.string :name
      t.string :email
      t.string :phone
      t.string :street_address
      t.string :city
      t.string :postcode
      t.string :state
      t.string :country
      t.string :programme
      t.boolean :scholarship
      t.boolean :laptop
      t.string :payment_plan
      t.string :accommodation
      t.string :agreement

      t.timestamps null: false
    end
    add_foreign_key :admissions, :fast_track_applications
  end
end
