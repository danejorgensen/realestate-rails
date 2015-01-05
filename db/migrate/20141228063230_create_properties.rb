class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :slug
      t.decimal :amount
      t.integer :bathrooms
      t.integer :bedrooms
      t.integer :sqft

      t.timestamps null: false
    end
  end
end
