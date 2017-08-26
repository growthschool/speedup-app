class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user, :liked_users, {:visible_comments => :user}).page(params[:page])

    post_ids = @posts.map {|p| p.id}
    @subscriptions_count = Post.where(:id => post_ids).joins(:subscriptions).group("posts.id").count
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.visible_comments.includes(:user)

  #  if current_user
  #    @my_comments = @post.comments.where(:status => "private", :user_id => current_user.id).includes(:user)
  #  end

    if current_user
      all_comments = @post.comments.where("status = ? OR (status = ? AND user_id = ?)", "public", "private", current_user.id).includes(:user)
      @comments = all_comments.select { |x| x.status == "public" }
      @my_comments = all_comments.select { |x| x.status == "private" }
    else
      @comments = @post.visible_comments.includes(:user)
    end
  end

  def report
  #  @posts = Post.all.sort_by{ |post| post.subscriptions.size }.reverse[0,10]
    @posts = Post.includes(:user).joins(:subscriptions).group("posts.id").select("posts.*, COUNT(subscriptions.id) as subscriptions_count").order("subscriptions_count DESC").limit(10)
  end

end
