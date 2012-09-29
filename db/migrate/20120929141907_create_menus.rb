class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.integer :position
      t.references :view
      t.references :page
      t.references :link

      t.timestamps
    end
    add_index :menus, :view_id
    add_index :menus, :page_id
    add_index :menus, :link_id
  end
end
