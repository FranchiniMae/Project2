class Challenge < ActiveRecord::Base
	has_many :posts

	has_many :challenge_users
	has_many :users, through: :challenge_users

end
