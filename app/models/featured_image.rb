class FeaturedImage < ActiveRecord::Base
  validates :url, presence: true
  belongs_to :post
end
