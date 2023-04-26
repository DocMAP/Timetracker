class ApplicationController < ActionController::Base
	include Pundit
	before_action :authenticate_user!

	def admin_types
		['AdminUser']
	end
end
