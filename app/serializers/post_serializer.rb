class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :categories, :user, :created_at, :images
  url [:user, :post]
  
  def user
    user = User.find(object.user_id)
    user.username
  end

  def created_at
    p object.created_at.strftime('%Y-%m-%d')
  end
end