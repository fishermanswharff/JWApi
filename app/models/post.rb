class Post < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user, dependent: :destroy
  validates :title, :body, presence: true
end