# todo: удалить после того как залью на хероку
class AddInfoToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :info, :string
      t.column :photo_id, :integer
    end
  end
end
