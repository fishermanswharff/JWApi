class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :created_at, :images
  url [:user, :post]

  def categories
    object.categories.map { |category| category.name }
  end
  
  def user
    object.user.username
  end

  def created_at
    p object.created_at.to_s(:rfc822)
  end

  def attributes(options=nil)
    object.attributes.merge!({images: get_image_urls})
  end

  private 
  def get_image_urls
    object.image.styles.map { |style| object.image.url(style[0]) }
  end
end