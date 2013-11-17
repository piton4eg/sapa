class AddHiddenToGalleries < ActiveRecord::Migration
  def change
    change_table :galleries do |t|
      t.column :hidden, :boolean, default: false
    end
  end
end
