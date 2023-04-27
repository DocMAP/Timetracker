class StaticController < ApplicationController
	def homepage
		if admin_types.include?(current_user.type)
			@pending_approvals = Post.where(status: 'submitted').page(params[:page]).per(5)
			@pending_submissions = AuditLog.where(status: 'pending').page(params[:page]).per(10)
		else
			@pending_confirmations = current_user.audit_logs.where(status: 'pending')
		end
	end
end