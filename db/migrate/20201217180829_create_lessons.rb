class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :professor
      t.string :time
      t.string :period
      t.string :genre
      t.string :evaluation

      t.timestamps
    end
  end
end
