class SorceryCore < ActiveRecord::Migration
  def change
    # todo: удалить users после того как залью на хероку
    drop_table :users

    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.string :info
      t.string :avatar

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
