class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  has_many :images, dependent: :destroy
  has_one :featured_image, dependent: :destroy
  has_one :thumbnail, dependent: :destroy
  has_and_belongs_to_many :categories
  belongs_to :user
end
