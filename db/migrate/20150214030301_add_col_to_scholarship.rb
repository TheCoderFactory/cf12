class AddColToScholarship < ActiveRecord::Migration
  def change
    add_column :scholarships, :close_date, :datetime
    add_column :scholarships, :announce_date, :datetime
  end
end
