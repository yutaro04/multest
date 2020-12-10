class CreateSchoolClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :school_classes do |t|
      t.string :name
      t.string :teacher

      t.timestamps
    end
  end
end
