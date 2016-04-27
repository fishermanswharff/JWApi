class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :created_at
  has_one :featured_image
  has_one :thumbnail
  has_many :images

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
end
