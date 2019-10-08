class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      flash[:success] = t ".active"
      if logged_in?
        flash[:danger]  = t ".login_many"
        redirect_to root_url
      else
        log_in user
        redirect_to user
      end
    else
      flash[:danger] = t ".unactive"
      redirect_to root_url
    end
  end
end
