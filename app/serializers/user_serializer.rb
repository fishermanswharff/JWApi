class UserSerializer < ActiveModel::Serializer
  has_many :posts  
end