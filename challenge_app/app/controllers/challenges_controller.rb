class ChallengesController < ApplicationController

	before_action :logged_in?

	def index
		@challenges = Challenge.all
		current_user #added this last
		render :index
	end 

	def new
		@challenge = Challenge.new
		render :new
	end 

	def create
		@challenge = Challenge.create(challenge_params)
		@challenge.users.push(current_user)
		redirect_to "/challenges"
	end 

	def show
		@challenge = Challenge.find(params[:id])
	end 

	def edit
		@challenge = Challenge.find(params[:id])
		# if (@current_user == @challenge.user)
		# 	render :edit
		# else
		# 	redirect_to "/"
		# end 
		#need to get the id of the person who posted the challenge
	end

	def update
		@challenge = Challenge.find(params[:id])
		@challenge.update_attributes(challenge_params)
		@challenge.save
		redirect_to challenges_path
	end 

	def destroy
		@challenge = Challenge.find(params[:id])
		@challenge.destroy
		redirect_to challenges_path
	end 

	private 

	def challenge_params
		challenge_params = params.require(:challenge).permit(:name, :description, :goal_date, :reward)
	end 

end
