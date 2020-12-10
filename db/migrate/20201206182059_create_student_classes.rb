class CreateStudentClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_classes do |t|
      t.integer :student_id
      t.integer :school_class_id
      t.string :result

      t.timestamps
    end
  end
end
