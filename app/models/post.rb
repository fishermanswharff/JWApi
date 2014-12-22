class Post < ActiveRecord::Base
  has_many :images, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :user
  validates :title, :body, presence: true
end