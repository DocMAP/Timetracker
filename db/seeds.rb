@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

puts "1 user created"

20.times do |post|
	Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "20 Posts have been created"