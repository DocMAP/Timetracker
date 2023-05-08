class TimetrackerMailer < ApplicationMailer
	def email timetracker
		@timetracker = timetracker
		mail(to: @timetracker.email, subject: 'Weekly Time Confirmation Notice')
	end
end
