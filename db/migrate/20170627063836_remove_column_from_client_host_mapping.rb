class RemoveColumnFromClientHostMapping < ActiveRecord::Migration
  def change
    remove_column :client_host_mappings, :quantity, :string
  end
end
