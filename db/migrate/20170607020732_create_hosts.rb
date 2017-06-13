class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name
      t.text :address
      t.integer :contact
      t.string :type

      t.timestamps null: false
    end
  end
end
