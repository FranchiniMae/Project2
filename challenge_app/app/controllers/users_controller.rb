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
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
		@user = User.create(user_params)
		login(@user)
		redirect_to "/users/#{@user.id}"
	end 

	def show
		@user = User.find(params[:id])
		render :show
	end 

	def edit
	end 

	def update 
	end 

	def destroy
	end 

end
