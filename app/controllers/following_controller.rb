class FollowingController < UsersController
  before_action :find_user

  def index
    @title = t ".following"
    @users = @user.following.page(params[:page]).per Settings.user.following
    render "show_follow"
  end
end
