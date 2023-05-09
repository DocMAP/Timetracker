namespace :notification do
  desc "Sends SMS notification to employees asking them to log overtime"
  task sms: :environment do
    if Time.now.sunday?
      employees = Employee.all
    # 1. Schedule to run Sunday at 5pm in heroku
    # 2. Iterate over all employees with pending audit logs
    # 3. Send instructions to complete
      employees.each do |employee|
        SmsTool.send_sms()
      end
    end
  end

  desc "Sends mail notifications to Admin to approve overtime requests"
  task timetracker_email: :environment do
    # 1. Iterate over the list of submitted requests
    # 2. Send email to each admin to approve/reject if submitted requests
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        TimetrackerMailer.email(admin).deliver_later
      end
    end
  end

end
