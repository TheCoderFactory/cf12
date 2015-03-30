class AddWebsiteToScholarship < ActiveRecord::Migration
  def change
    add_column :scholarships, :website, :string
  end
end
