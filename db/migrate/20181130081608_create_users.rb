class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :pass
      t.index :email, unique: true

      t.timestamps
    end
    #Ex:- add_index("admin_users", "username")
  end
end
