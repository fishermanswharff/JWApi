class CreateFeaturedImage < ActiveRecord::Migration
  def change
    create_table :featured_images do |t|
      t.string :url
      t.belongs_to :post, index: true
      t.timestamps null: false
    end
  end
end
