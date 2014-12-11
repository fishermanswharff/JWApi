class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :created_at #, :image, :images
  has_many :images
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
end