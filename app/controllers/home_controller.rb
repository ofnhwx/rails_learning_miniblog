class HomeController < ApplicationController
  include Pagy::Backend

  def index
    @post = Post.new
    @pagy, @feeds = pagy(Post.all)
  end
end
