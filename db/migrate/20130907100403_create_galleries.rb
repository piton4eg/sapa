class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :image

      t.timestamps
    end

    add_reference :photos, :gallery, index: true
  end
end
