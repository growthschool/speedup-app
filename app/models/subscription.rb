class Subscription < ApplicationRecord

  belongs_to :post, :counter_cache => "subscriptions_count"  # 或者 :counter_cache => true
  belongs_to :user

end
