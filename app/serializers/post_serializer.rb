class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :created_at, :image, :images
  url [:user, :post]

  def categories
    object.categories.map { |category| category.name }
  end
  
  def user
    object.user.username
  end

  def image
    object.image.url(:medium)
  end

  def created_at
    p object.created_at.to_s(:rfc822)
  end

  def images
    get_image_urls
  end

  private 
  def get_image_urls
    styles = object.image.styles.map { |style| style[0] }
    styles.map { |style| object.image.url(style) }
  end
end