class RemoveTitleFromQuotes < ActiveRecord::Migration
  def up
  	remove_column :quotes, :title
  end

  def down
  end
end
