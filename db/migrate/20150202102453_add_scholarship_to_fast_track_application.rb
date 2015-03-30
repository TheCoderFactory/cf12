class AddScholarshipToFastTrackApplication < ActiveRecord::Migration
  def change
    add_reference :fast_track_applications, :scholarship, index: true
    add_foreign_key :fast_track_applications, :scholarships
  end
end
