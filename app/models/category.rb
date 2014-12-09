class Category < ActiveRecord::Base
  has_and_belongs_to_many :post
  validates :name, presence: true
end