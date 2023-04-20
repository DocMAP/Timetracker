class AuditLogsController < ApplicationController

	def index
		@audit_logs = AuditLog.page(params[:page]).per(10)

		unless current_user.type == 'AdminUser'
        	flash[:alert] = "You are not authorized to access this page."
        	redirect_to(root_path)
      	end
	end
end
