class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :author
      t.text :content
      t.references :user
      t.references :section

      t.timestamps
    end
    add_index :quotes, :user_id
    add_index :quotes, :section_id
  end
end
