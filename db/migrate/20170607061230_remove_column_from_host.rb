class RemoveColumnFromHost < ActiveRecord::Migration
  def change
    remove_column :hosts, :type, :string
    remove_column :hosts, :contact, :integer
  end
end
