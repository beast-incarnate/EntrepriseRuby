class AddColumnItemNameToClientHostMapping < ActiveRecord::Migration
  def change
    add_column :client_host_mappings, :item_name, :string
  end
end
