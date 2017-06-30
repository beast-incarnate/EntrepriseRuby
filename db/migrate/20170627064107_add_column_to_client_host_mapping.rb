class AddColumnToClientHostMapping < ActiveRecord::Migration
  def change
    add_column :client_host_mappings, :quantity, :integer
  end
end
