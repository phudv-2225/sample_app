class SessionsController < ApplicationController
  def new; end

  def create
    if logged_in?
      flash[:danger]  = t ".login_many"
      redirect_to root_url
    else
      user = User.find_by email: params[:session][:email].downcase

      if user&.authenticate params[:session][:password]
        log_in user
        params[:session][:remember_me] == Settings.session.check_box ? remember(user) : forget(user)
        redirect_back_or user
      else
        flash[:danger]  = t ".login_fail"
        render :new
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
