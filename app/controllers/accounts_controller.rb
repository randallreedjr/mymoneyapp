class AccountsController < ApplicationController
	before_filter :signed_in_user
	
	def create
		@account = current_user.accounts.build(params[:account])
		if @account.save
			flash[:success] = "Account added!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end
	end

	def destroy
	end
end