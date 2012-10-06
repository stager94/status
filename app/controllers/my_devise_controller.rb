class MyDeviseController < Devise::SessionsController
	def create
		super
		current_user.online = true
		current_user.save
	end

	def destroy
		current_user.online = false
		current_user.save
		super
		reset_session
	end
end
