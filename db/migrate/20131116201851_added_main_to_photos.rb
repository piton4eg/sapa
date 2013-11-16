class AddedMainToPhotos < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.column :main_photo, :booleand, default: false
      t.column :portfolio, :booleand, default: false
    end
  end
end
