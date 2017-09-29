class PostsController < ApplicationController

  def index
    # @posts = Post.page(params[:page])
    # @posts = Post.includes(:user).page(params[:page])
    # @posts = Post.includes(:user, :liked_users, { :comments => :user } ).page(params[:page])
    @posts = Post.includes(:user, :liked_users, { :visible_comments => :user } ).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    # @comments = @post.comments
    @comments = @post.comments.visible.includes(:user)

    if current_user
      @my_comments = @post.comments.where( :status => "private", :user_id => current_user.id ).includes(:user)
    end
  end

  def report
    @posts = Post.all.sort_by{ |post| post.subscriptions.size }.reverse[0,10]
  end

end
