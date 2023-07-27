class RemoveAuthorIdIdColumnInLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id_id
    remove_column :likes, :post_id_id
  end
end
