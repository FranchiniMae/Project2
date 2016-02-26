class ChallengeUsersController < ApplicationController

	before_action :logged_in?

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
		@user_challenge = @user.challenges.push(@challenge)

		redirect_to user_challenges_path(@user)
		#user_challenges(@user) is not working
	end

	def destroy 
		@user = current_user
		@challenge = Challenge.find(params[:challenge_id])
		@user_challenge.destroy
	end

	#change this so that it goes to the user homepage

end
