class CreateClientHostMappings < ActiveRecord::Migration
  def change
    create_table :client_host_mappings do |t|
      t.references :client, index: true, foreign_key: true
      t.references :host, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true
      t.string :quantity
      t.integer :status

      t.timestamps null: false
    end
  end
end
