@user = User.create(email: "test@test.com", 
					password: "password", 
					password_confirmation: "password", 
					first_name: "Jon", 
					last_name: "Snow",
					phone: "3348683488")

puts "1 user created"

AdminUser.create(email: "admin@admin.com", 
				password: "password", 
				password_confirmation: "password", 
				first_name: "Mark", 
				last_name: "Popwell",
				phone: "3348683488")

puts "1 AdminUser created"

20.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "20 Posts have been created"

5.times do |audit_log|
	AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 2.days))
end

puts "5 AuditLogs have been created"