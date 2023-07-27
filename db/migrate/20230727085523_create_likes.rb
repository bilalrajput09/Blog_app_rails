class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :author_id
      t.references :author_id, null: false, foregion_key: { to_table: :users }
      t.integer :post_id
      t.references :post_id, null: false, foregion_key: { to_table: :posts }
      t.index :author_id
      t.index :post_id
      t.timestamps
    end
  end
end
