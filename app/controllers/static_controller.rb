class StaticController < ApplicationController
	def homepage
		@pending_approvals = Post.where(status: 'submitted').page(params[:page]).per(5)
	end
end