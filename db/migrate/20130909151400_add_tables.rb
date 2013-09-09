class AddTables < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :image
      t.references :gallery
      t.boolean :image_processed

      t.timestamps
    end

    create_table :galleries do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.references :photo

      t.timestamps
    end
  end
end
