class UsersController < ApplicationController

	def my_profile
		@user = current_user
	end

	def update
		current_user.update(
			username: params[:user][:username],
			email: params[:user][:email],
			avatar: params[:user][:avatar]

			)
		redirect_to action: "my_profile"
	end
end

