class PostsController < ApplicationController

	def index
		@posts = Post.all
	end 

	def new
		@post = Post.new
		@challenges = Challenge.all
		render :new
	end

	def create
		p @post
		post_params = params.require(:post).permit(:comment, :picture, :challenge_id)
		@post = Post.create(post_params)
		challenge = @post.challenge_id
		if @post.save
			redirect_to challenge_path(challenge)
		else
			render :new
		end 
	end 

end
