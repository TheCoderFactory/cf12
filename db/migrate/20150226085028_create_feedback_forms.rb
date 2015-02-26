class CreateFeedbackForms < ActiveRecord::Migration
  def change
    create_table :feedback_forms do |t|
      t.integer :course_id
      t.integer :location_id
      t.integer :satisfaction
      t.integer :recommend
      t.integer :another
      t.integer :achieve
      t.integer :value
      t.text :best_part
      t.text :comments

      t.timestamps null: false
    end
  end
end
