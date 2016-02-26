class AddChallengeIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :challenge_id, :integer
  end
end
