class AddReferralToPreQuestionnaire < ActiveRecord::Migration
  def change
    add_column :pre_questionnaires, :referral, :string
  end
end
