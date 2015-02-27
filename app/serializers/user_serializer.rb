class UserSerializer < ActiveModel::Serializer
  has_many :posts
  attributes :username, :first_name, :last_name, :role, :email, :token
end