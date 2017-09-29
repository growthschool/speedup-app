class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  scope :visible, -> { where( :status => "public") }
  scope :mine, -> (user){ where( :status => "private", :user_id => user.id ) }

end
