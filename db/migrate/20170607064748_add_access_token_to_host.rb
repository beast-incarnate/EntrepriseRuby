class AddAccessTokenToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :access_token, :string
  end
end
