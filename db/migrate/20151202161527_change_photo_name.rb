class ChangePhotoName < ActiveRecord::Migration
  def up
    change_column :photos, :name, :string, null: true
  end

  def down
    change_column :photos, :name, :string, null: false
  end
end
