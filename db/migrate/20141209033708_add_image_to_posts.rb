class AddImageToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :image
  end
end
