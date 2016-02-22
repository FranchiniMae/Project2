class CreateChallengeUsers < ActiveRecord::Migration
  def change
    create_table :challenge_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
