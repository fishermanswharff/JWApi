class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :created_at, :images, :featured_image, :thumbnail #, :user 
  url [:user, :post]

  def user
    user = User.find(object.user_id)
    user.username
  end

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end
end