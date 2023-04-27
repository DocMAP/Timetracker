class AuditLogsController < ApplicationController

	def index
		@audit_logs = AuditLog.page(params[:page]).per(10)

		unless current_user.type == 'AdminUser'
        	flash[:alert] = "You are not authorized to access this page."
        	redirect_to(root_path)
      	end
	end

	def confirm
		audit_log = AuditLog.find(params[:id])

		if audit_log.user_id = current_user.id || 'AdminUser'
			audit_log.confirmed!
			redirect_to root_path, notice: "The submission has been confirmed"
		else
			flash[:alert] = "You are not authorized to confirm this time entry."
        	redirect_to(root_path)
        end
	end
end
