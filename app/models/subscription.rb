class Subscription < ApplicationRecord

  belongs_to :post
  belongs_to :user
  belongs_to :post, :counter_cache => true
end
