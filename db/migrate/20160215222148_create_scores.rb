class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.string :admin
      t.string :intervention
      t.string :level
      t.integer :peer
      t.string :grade
      t.integer :gradeNum

      t.timestamps null: false
    end
  end
end
