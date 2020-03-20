class PostsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: %i[create]

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました！'
      redirect_to root_url
    else
      # TODO: この後でページを移動したりするとまずい
      #       具体的にどうするかは後で考える
      @pagy, @feeds = pagy(Post.all)
      render 'home/index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
