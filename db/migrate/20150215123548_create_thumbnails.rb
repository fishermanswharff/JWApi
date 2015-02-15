class CreateThumbnails < ActiveRecord::Migration
  def change
    create_table :thumbnails do |t|
      t.string :url
      t.belongs_to :post, index: true
      t.timestamps null: false
    end
  end
end
