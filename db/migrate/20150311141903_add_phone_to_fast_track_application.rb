class AddPhoneToFastTrackApplication < ActiveRecord::Migration
  def change
    add_column :fast_track_applications, :phone, :string
  end
end
