class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  scope :visible, -> { where( :status => "public" ) }

end
