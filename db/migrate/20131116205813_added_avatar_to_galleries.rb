class AddedAvatarToGalleries < ActiveRecord::Migration
  def change
    change_table :galleries do |t|
      t.column :info, :string
      t.column :avatar_id, :integer
    end
  end
end
