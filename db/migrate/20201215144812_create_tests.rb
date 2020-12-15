class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.integer :visual
      t.integer :introspective
      t.integer :language
      t.integer :music
      t.integer :Interpersonal
      t.integer :physical
      t.integer :museum
      t.integer :spirituality
      t.integer :logical
      t.timestamps
    end
  end
end
