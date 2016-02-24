class User < ActiveRecord::Base

	has_secure_password

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

	has_many :challenge_users
	has_many :challenges, through: :challenge_users
	has_many :posts

end
