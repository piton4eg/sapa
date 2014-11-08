class SomeFix < ActiveRecord::Migration
  def change
    # todo: удалить users после того как залью на хероку
    remove_column :users, :photo_id
    remove_column :photos, :description
    # maybe it need for carrierwave?
    remove_column :photos, :image_processed

    remove_column :galleries, :photo_id
    remove_column :galleries, :description

    # todo: удалить users после того как залью на хероку
    add_column :users, :avatar, :string
  end
end
