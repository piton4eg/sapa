class AddImageProcessedToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :image_processed, :boolean
  end
end
