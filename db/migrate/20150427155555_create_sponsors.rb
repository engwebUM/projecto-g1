class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :organization
      t.string :person_name
      t.string :person_role
      t.string :person_email
      t.string :person_phone
      t.float :extra_pay
      t.string :state
      t.string :next_step
      t.text :notes

      t.belongs_to :user, index: true
      t.belongs_to :plan, index: true

      t.timestamps null: false
    end
  end
end
