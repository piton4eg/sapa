class AddedMainToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.column :main_photo, :boolean, default: false
      t.column :portfolio, :boolean, default: false
    end
  end
end
