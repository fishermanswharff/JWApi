class AddImageCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :images_count, :integer
  end
end
