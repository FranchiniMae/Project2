class AddPictureToChallenges < ActiveRecord::Migration
  def change
  	add_column :challenges, :img_url, :string
  end
end
