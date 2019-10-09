class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: %i(destroy)

  def create
    @micropost = current_user.microposts.build micropost_params

    if @micropost.save
      flash[:success] = t ".created_success"
      redirect_to root_url
    else
      flash[:danger] = t ".created_error"
      @feed_items = current_user.feed.page(params[:page])
        .per Settings.micropost.show.feed_items
      render "static_pages/home"
    end
  end

  def destroy
    @micropost.destroy
    @micropost.destroyed? ? flash[:success] = t(".delete_success")
      : flash[:danger] = t(".delete_error")
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit Micropost::PARAMS
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url if @micropost.nil?
  end
end
