class AddColumnaccesstokenToClient < ActiveRecord::Migration
  def change
    add_column :clients, :access_token, :string
  end
end
