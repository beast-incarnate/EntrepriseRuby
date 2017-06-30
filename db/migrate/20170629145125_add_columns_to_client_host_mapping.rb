class AddColumnsToClientHostMapping < ActiveRecord::Migration
  def change
    add_column :client_host_mappings, :host_name, :string
    add_column :client_host_mappings, :client_name, :string
  end
end
