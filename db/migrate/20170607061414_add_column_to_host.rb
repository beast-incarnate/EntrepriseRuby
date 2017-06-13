class AddColumnToHost < ActiveRecord::Migration
  def change
    add_column :hosts, :contact, :string
  end
end
