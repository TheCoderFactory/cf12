class CreatePreQuestionnaires < ActiveRecord::Migration
  def change
    create_table :pre_questionnaires do |t|
      t.string :name
      t.string :gender
      t.string :age
      t.text :reason
      t.text :background
      t.text :experience
      t.text :hobbies
      t.integer :order_id

      t.timestamps null: false
    end
  end
end
