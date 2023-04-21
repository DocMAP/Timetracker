class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]

	def approve
		@post.approved!
		redirect_to root_path, notice: "The submission has been approved"
	end

	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(10)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
		redirect_to @post, notice: 'Your request was successfully submitted'
		else
			render :new
		end
	end

	def show
	end

	def edit
		unless current_user.type == 'AdminUser' || @post.status != 'approved'
        	flash[:alert] = "You are not authorized to access this page."
        	redirect_to(posts_path)
      	end
      	

	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: 'Your request was updated successfully'
		else
			render :edit
		end
	end

	def destroy
		@post.delete
		redirect_to posts_path, notice: 'Your request was deleted'
	end

	private

		def post_params
			params.require(:post).permit(:date, :rationale, :status, :hours_requested)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
