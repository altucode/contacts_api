class ChangeContact < ActiveRecord::Migration
  def change
    change_table :contacts do |t|
      t.boolean :favorite, default: false
      t.timestamps
    end

    change_table :contact_shares do |t|
      t.boolean :favorite, default: false
      t.datetime :created_at
    end
  end
end
