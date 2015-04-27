class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :slots
      t.float :price
      t.integer :tickets
      t.float :discount_coupon
      t.integer :discount_tickets
      t.text :description

      t.timestamps null: false
    end
  end
end
