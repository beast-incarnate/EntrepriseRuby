class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :host, index: true, foreign_key: true
      t.string :name
      t.string :type
      t.integer :price
      t.integer :amount

      t.timestamps null: false
    end
  end
end
