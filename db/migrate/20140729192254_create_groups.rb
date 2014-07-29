class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.integer :owner_id, null: false

      t.timestamps
    end

    add_index :groups, :owner_id
  end
end
