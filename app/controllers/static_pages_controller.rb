class StaticPagesController < ApplicationController
  def home
  	@account = current_user.accounts.build if signed_in?
  end

  def help
  end

  def about
  end

  def contact
  end

end
