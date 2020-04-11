# frozen_string_literal: true

class PostsController < ApplicationController
  include Pagy::Backend
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_post, only: %i[show favorited_by]

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def show; end

  def favorited_by; end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '投稿しました！'
      redirect_to posts_path
    else
      render 'posts/new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
