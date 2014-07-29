class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.integer :group_id, null: false
      t.integer :contact_id, null:false

      t.datetime :created_at
    end

    add_index :group_memberships, [:group_id, :contact_id], unique: true
  end
end
