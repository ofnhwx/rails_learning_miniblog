class RootController < ApplicationController
  include Pagy::Backend

  def index
    if user_signed_in?
      @pagy, @posts = pagy(current_user.feed)
    else
      @pagy, @posts = pagy(Post.all)
    end
    render 'posts/index'
  end
end
