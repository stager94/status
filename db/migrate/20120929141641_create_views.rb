class CreateViews < ActiveRecord::Migration
  def change
    create_table :views do |t|
      t.string :title
      t.integer :code

      t.timestamps
    end
  end
end
