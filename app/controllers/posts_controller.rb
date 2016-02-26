class PostsController < ApplicationController

	before_action :logged_in?

	def index
		@posts = Post.all
	end 

	def new
		@post = Post.new
		@challenges = Challenge.all
		render :new
	end

	def create
		@post = current_user.posts.new(post_params)
		challenge = @post.challenge_id
		if @post.save
			redirect_to challenge_path(challenge)
		else
			render :new
		end 
	end 

	def show
		@post = Post.find(params[:id])
		@challenge = Challenge.find(@post.challenge_id)
		render :show
	end 

	def edit
		@post = Post.find(params[:id])
		@challenge = Challenge.find(@post.challenge_id)
		if (@current_user == @post.user)
			render :edit
		else
			redirect_to "/",
				error: "ILLEGAL ACTION"
		end 
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		@post.save
		challenge = @post.challenge_id
		redirect_to challenge_path(challenge)
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		challenge = @post.challenge_id
		redirect_to challenge_path(challenge)
	end 

	private

	def post_params
		post_params = params.require(:post).permit(:comment, :picture, :challenge_id)
	end 

end
