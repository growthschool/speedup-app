class Post < ApplicationRecord

  belongs_to :user
  has_many :comments
  has_many :visible_comments, -> { visible }, :class_name => "Comment"

  has_many :subscriptions
  has_many :subscribed_users, :through => :subscriptions, :source => :user

  has_many :likes
  has_many :liked_users, :through => :likes, :source => :user

  
end
