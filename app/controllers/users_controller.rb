class UsersController < ApplicationController
  before_action :current_user, only: %i(show)

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t ".signup_success"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def current_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger]  = t ".error"
    redirect_to root_url
  end
end
