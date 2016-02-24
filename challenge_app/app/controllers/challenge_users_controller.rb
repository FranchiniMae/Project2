class ChallengeUsersController < ApplicationController

	def index
		# @user = User.find(params[:user_id])
		# @challenges = @user.challenges
		@user = User.find(params[:user_id])
		@challenges = @user.challenges
		render :index
		#get users to show up on challenges
		# render :index
	end 

	def create
		@user = current_user
		@challenge = Challenge.find(params[:challenge_id])
		@user.challenges.push(@challenge)
		redirect_to user_challenges_path(@user)
		#user_challenges(@user) is not working
	end

	#change this so that it goes to the user homepage

end
