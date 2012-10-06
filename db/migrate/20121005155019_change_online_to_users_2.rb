class ChangeOnlineToUsers2 < ActiveRecord::Migration
  def change
  	change_column :users, :online, :boolean, :default => true
  	change_column :users, :admin, :boolean, :default => false
  end
end
