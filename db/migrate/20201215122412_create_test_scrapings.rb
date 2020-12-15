class CreateTestScrapings < ActiveRecord::Migration[5.2]
  def change
    create_table :test_scrapings do |t|
      t.integer :q_num
      t.string :question
      t.timestamps
    end
  end
end
