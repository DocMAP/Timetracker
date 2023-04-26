class PostPolicy < ApplicationPolicy
	def update?
		record.user_id == user.id
	end

	def approve?
		admin?
	end
end
