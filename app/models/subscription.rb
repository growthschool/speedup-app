class Subscription < ApplicationRecord

  belongs_to :post, :counter_cache => true
  belongs_to :user

  # 或 belongs_to :post, :counter_cache => "subscriptions_count"

end
