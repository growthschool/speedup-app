class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user, :liked_users, { :visible_comments => :user } ).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
  end

  def report
    @posts = Post.all.sort_by{ |post| post.subscriptions.size }.reverse[0,10]
  end

end
