class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, null: false, index: true
      t.boolean :is_final, null: false, default: false, index: true

      t.timestamps null: false
    end
  end
end
