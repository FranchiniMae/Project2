class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.date :goal_date
      t.text :reward

      t.timestamps null: false
    end
  end
end
