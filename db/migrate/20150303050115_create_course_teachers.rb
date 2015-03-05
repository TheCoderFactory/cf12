class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :course_teachers do |t|
      t.integer :product_id
      t.references :teacher, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_teachers, :teachers
  end
end
