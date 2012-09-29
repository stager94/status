class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.boolean :admin
      t.attachment :avatar

      t.timestamps
    end
  end
end
