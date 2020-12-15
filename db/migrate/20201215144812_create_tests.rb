class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.float :visual
      t.float :introspective
      t.float :language
      t.float :music
      t.float :interpersonal
      t.float :physical
      t.float :museum
      t.float :spirituality
      t.float :logical
      t.integer :student_id
      t.timestamps
    end
  end
end
