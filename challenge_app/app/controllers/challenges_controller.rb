class ChallengesController < ApplicationController

	def index
		@challenges = Challenge.all
		render :index
	end 

	def new
		@challenge = Challenge.new
		render :new
	end 

	def create
		@challenge = Challenge.create(challenge_params)
		redirect_to "/challenges"
	end 

	def show
		@challenge = Challenge.find(params[:id])
	end 

	def edit
		@challenge = Challenge.find(params[:id])
	end

	def update
		@challenge = Challenge.find(params[:id])
		@challenge.update_attributes(challenge_params)
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
