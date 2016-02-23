class PostsController < ApplicationController

	def index
		@posts = Post.all
	end 

	def new
		@post = Post.new
		render :new
	end

	def create
		post_params = params.require(:post).permit(:comment, :picture)
		@post = Post.create(post_params)
		redirect_to "/posts"
	end 

end
