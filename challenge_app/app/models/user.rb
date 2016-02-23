class User < ActiveRecord::Base

	has_secure_password
	validates_confirmation_of :password

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end

	has_many :challenges
	has_many :posts

end
