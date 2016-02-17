class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :name
      t.string :admin
      t.string :level
      t.string :grade

      t.timestamps null: false
    end
  end
end
