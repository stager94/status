class AddSexToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sex, :integer, :default => 0
  end
end
