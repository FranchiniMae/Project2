class ChallengeUsersController < ApplicationController

	def index
		# @user = User.find(params[:user_id])
		# @challenges = @user.challenges
		@challenges = Challenge.all
		current_user

		#get users to show up on challenges
		render :index
	end 

	#change this so that it goes to the user homepage

end
