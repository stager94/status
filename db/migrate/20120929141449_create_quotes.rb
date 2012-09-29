class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.text :content
      t.string :author
      t.references :user
      t.references :category

      t.timestamps
    end
    add_index :quotes, :user_id
    add_index :quotes, :category_id
  end
end
