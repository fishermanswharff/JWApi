class Image < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  validates :url, presence: true
end
