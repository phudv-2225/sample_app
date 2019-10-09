class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.page(params[:page])
        .per Settings.micropost.show.feed_items
    end
  end

  def help; end

  def about; end

  def contact; end
end
