class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments

  has_many :subscriptions
  has_many :subscribe_posts, :through => :subscriptions, :source => :post

  has_many :likes
  has_many :like_posts, :through => :likes, :source => :post

  def display_name
    self.email.split("@").first
  end
  def like_post?(post)
    # 或是写 self.likes.where( :post_id => post.id ).first.present? 也可以
    post.liked_users.include?(self)
  end
end
