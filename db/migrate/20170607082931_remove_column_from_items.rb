class RemoveColumnFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :type, :string
  end
end
