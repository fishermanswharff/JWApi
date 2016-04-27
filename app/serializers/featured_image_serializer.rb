class FeaturedImageSerializer < ActiveModel::Serializer
  attributes :url
  belongs_to :post
end
