class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.refrences :author_id, null: false, foregion_key: { to_table: :users }
      t.refrences :post_id, null: false, foregion_key: { to_table: :posts }
      t.timestamps
    end
  end
end
