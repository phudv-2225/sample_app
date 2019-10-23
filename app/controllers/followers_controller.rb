class FollowersController < UsersController
  before_action :find_user

  def index
    @title = t ".followers"
    @users = @user.followers.page(params[:page]).per Settings.user.followers
    render "show_follow"
  end
end
