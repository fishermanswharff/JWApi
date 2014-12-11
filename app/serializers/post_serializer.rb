class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :created_at, :images #, :image, :images
  url [:user, :post]

  def categories
    object.categories.map { |category| category.name }
  end

  def images
    object.images.map { |image| image.url }
  end
  
  def user
    object.user.username
  end

  def created_at
    p object.created_at.to_s(:rfc822)
  end
end