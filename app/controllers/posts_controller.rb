class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

end
