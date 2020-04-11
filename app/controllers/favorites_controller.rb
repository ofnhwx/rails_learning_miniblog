# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    current_user.like(@post)
    redirect_to @post
  end

  def destroy
    current_user.unlike(@post)
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
