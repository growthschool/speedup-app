class Subscription < ApplicationRecord

  belongs_to :post, :counter_cache => true
  #or -- belongs_to :post, :counter_cache => "subscriptions_count"
  belongs_to :user


end
