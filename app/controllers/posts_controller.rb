class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user, :liked_users, { :visible_comments => :user } ).order("id DESC").page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    if current_user
      all_comments = @post.comments.where("status = ? OR (status = ? AND user_id = ?)", "public", "private", current_user.id).includes(:user)
      @comments = all_comments.select{ |x| x.status == "public" }
      @my_comments = all_comments.select{ |x| x.status == "private" }
    else
      @comment = @post.comments.visible.includes(:user)
    end
  end

  def report
    @posts = Post.includes(:user).joins(:subscriptions).group("posts.id").select("posts.*, COUNT(subscriptions.id) as subscriptions_count").order("subscriptions_count DESC").limit(10)
  end

end
