class UsersController < ApplicationController

	before_action :logged_in?, except: [:index, :new, :create]

	def index
		@users = User.all
		render :index
	end 

	def new
		@user = User.new
		#might need to change render
		render :new
	end

	def create
		@user = User.create(user_params)
		login(@user)
		redirect_to "/users/#{@user.id}"
	end 

	def show
		@user = User.find(params[:id])
		render :show
	end 

	def edit
		@user = User.find(params[:id])
	end 

	def update 
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		@user.save
		redirect_to user_path
	end 

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
	end 

	private

	def user_params
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

end
