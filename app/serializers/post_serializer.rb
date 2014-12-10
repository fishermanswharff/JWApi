class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :image, :created_at
  url [:user, :post]

  def categories
    object.categories.map { |category| object.categories.name = category.name }
  end
  
  def user
    object.user.username
  end

  def created_at
    p object.created_at.to_s(:rfc822)
  end
end