class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :image
  url [:user, :post]

  def categories
    object.categories.map { |category| category.name }
  end
  
  def user
    object.user.username
  end
end