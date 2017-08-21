class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def report
    @posts = Post.all.sort_by{ |post| post.subscriptions.size }.reverse[0,10]
  end

end
