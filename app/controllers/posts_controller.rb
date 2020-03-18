class PostsController < ApplicationController
  include Pagy::Backend

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = ['投稿しました！']
    else
      flash[:danger] = @post.errors.full_messages
    end
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
