class AddSponsorshipToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :sponsorship, :string
  end
end
