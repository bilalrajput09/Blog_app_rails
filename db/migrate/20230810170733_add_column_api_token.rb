class AddColumnApiToken < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :api_token, :string, default: '123456'
  end
end
